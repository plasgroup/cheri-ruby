#ifndef COROUTINE_UCONTEXT_CONTEXT_H
#define COROUTINE_UCONTEXT_CONTEXT_H 1

/*
 *  This file is part of the "Coroutine" project and released under the MIT License.
 *
 *  Created by Samuel Williams on 24/6/2019.
 *  Copyright, 2019, by Samuel Williams.
*/

#pragma once

#include <assert.h>
#include <stddef.h>
#include <ucontext.h>

#define COROUTINE __attribute__((noreturn)) void

#ifdef HAVE_STDINT_H
#include <stdint.h>
#if INTPTR_MAX <= INT32_MAX
#define COROUTINE_LIMITED_ADDRESS_SPACE
#endif
#endif

struct coroutine_context
{
    ucontext_t state;
    struct coroutine_context * from;
    void *argument;
};

typedef COROUTINE(* coroutine_start)(struct coroutine_context *from, struct coroutine_context *self);

COROUTINE coroutine_trampoline(void * _start, void * _context);

static inline void coroutine_initialize_main(struct coroutine_context * context) {
    context->from = NULL;
    getcontext(&context->state);
}

static inline void coroutine_initialize(
    struct coroutine_context *context,
    coroutine_start start,
    void *stack,
    size_t size
) {
    assert(start && stack && size >= 1024);

    coroutine_initialize_main(context);

    context->state.uc_stack.ss_size = size;
    // Despite what it's called, this is not actually a stack pointer. It points to the address of the stack allocation (the lowest address).
    context->state.uc_stack.ss_sp = (char*)stack;
    context->state.uc_stack.ss_flags = 0;
    context->state.uc_link = NULL;

    makecontext(&context->state, (void(*)(void))coroutine_trampoline, 2, (void*)start, (void*)context);
#if defined(__CHERI_PURE_CAPABILITY__)
#if defined(__riscv)
    context->state.uc_mcontext.mc_capregs.cp_ca[0] = (__uintcap_t) start;
    context->state.uc_mcontext.mc_capregs.cp_ca[1] = (__uintcap_t) context;
#elif defined(__aarch64__)
    context->state.uc_mcontext.mc_capregs.cap_x[0] = (__uintcap_t) start;
    context->state.uc_mcontext.mc_capregs.cap_x[1] = (__uintcap_t) context;
#else
#error "Unsupported CHERI architecture for coroutine arguments"
#endif
#endif
}

static inline struct coroutine_context * coroutine_transfer(struct coroutine_context * current, struct coroutine_context * target)
{
    struct coroutine_context * previous = target->from;

    target->from = current;
    swapcontext(&current->state, &target->state);
    target->from = previous;

    return target;
}

static inline void coroutine_destroy(struct coroutine_context * context)
{
    context->state.uc_stack.ss_sp = NULL;
    context->state.uc_stack.ss_size = 0;
    context->from = NULL;
}

#endif /* COROUTINE_UCONTEXT_CONTEXT_H */
