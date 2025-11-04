#include <stdio.h>

// #include <cheri.h>
// #include <cheri/cheri.h>
#include <cheriintrin.h>

#include <stdint.h>

typedef uintptr_t VALUE;
typedef uintptr_t ID;

typedef struct rb_iseq_struct rb_iseq_t;
#define rb_iseq_t rb_iseq_t

#define offsetof(t, d) __builtin_offsetof(t, d)
# define BITFIELD(type, name, size) type name : size
#define ANYARGS

#define END_OF_ENUMERATION(key) END_OF_##key##_PLACEHOLDER = 0

typedef enum {
    METHOD_VISI_UNDEF     = 0x00,
    METHOD_VISI_PUBLIC    = 0x01,
    METHOD_VISI_PRIVATE   = 0x02,
    METHOD_VISI_PROTECTED = 0x03,

    METHOD_VISI_MASK = 0x03
} rb_method_visibility_t;

typedef struct rb_scope_visi_struct {
    BITFIELD(rb_method_visibility_t, method_visi, 3);
    unsigned int module_func : 1;
} rb_scope_visibility_t;


typedef struct rb_cref_struct {
    VALUE flags;
    VALUE refinements;
    VALUE klass_or_self;
    struct rb_cref_struct * next;
    const rb_scope_visibility_t scope_visi;
} rb_cref_t;



typedef struct rb_method_iseq_struct {
    const rb_iseq_t * iseqptr; /*!< iseq pointer, should be separated from iseqval */
    rb_cref_t * cref;          /*!< class reference, should be marked */
} rb_method_iseq_t; /* check rb_add_method_iseq() when modify the fields */

typedef VALUE (*rb_cfunc_t)(ANYARGS);
typedef struct rb_method_cfunc_struct {
    rb_cfunc_t func;
    VALUE (*invoker)(VALUE recv, int argc, const VALUE *argv, VALUE (*func)(ANYARGS));
    int argc;
} rb_method_cfunc_t;

typedef struct rb_method_attr_struct {
    ID id;
    VALUE location; /* should be marked */
} rb_method_attr_t;

typedef struct rb_method_alias_struct {
    struct rb_method_entry_struct * original_me; /* original_me->klass is original owner */
} rb_method_alias_t;

typedef struct rb_method_refined_struct {
    struct rb_method_entry_struct * orig_me;
} rb_method_refined_t;


typedef enum {
    VM_METHOD_TYPE_ISEQ,      /*!< Ruby method */
    VM_METHOD_TYPE_CFUNC,     /*!< C method */
    VM_METHOD_TYPE_ATTRSET,   /*!< attr_writer or attr_accessor */
    VM_METHOD_TYPE_IVAR,      /*!< attr_reader or attr_accessor */
    VM_METHOD_TYPE_BMETHOD,
    VM_METHOD_TYPE_ZSUPER,
    VM_METHOD_TYPE_ALIAS,
    VM_METHOD_TYPE_UNDEF,
    VM_METHOD_TYPE_NOTIMPLEMENTED,
    VM_METHOD_TYPE_OPTIMIZED, /*!< Kernel#send, Proc#call, etc */
    VM_METHOD_TYPE_MISSING,   /*!< wrapper for method_missing(id) */
    VM_METHOD_TYPE_REFINED,   /*!< refinement */

    END_OF_ENUMERATION(VM_METHOD_TYPE)
} rb_method_type_t;




int main() {
	struct rb_method_definition_struct {
		rb_method_type_t type : 4;
		unsigned int iseq_overload: 1;
		unsigned int no_redef_warning: 1;
		unsigned int aliased : 1;
		// 7
		// int reference_count : 28;
		int reference_count : 28;
	
		union {
			int* a;
			int b;
			int c;
			// rb_method_iseq_t iseq;
			// rb_method_cfunc_t cfunc;
			// rb_method_attr_t attr;
			// rb_method_alias_t alias;
			// rb_method_refined_t refined;
			// rb_method_bmethod_t bmethod;
			// rb_method_optimized_t optimized;
		} body;
	
		// uintptr_t original_id;
		// uintptr_t method_serial;
	};
		
	typedef struct rb_method_definition_struct rb_method_definition_t;
	int a = offsetof(rb_method_definition_t, body); 
	printf("a %d\n", a);
	int b = sizeof(rb_method_definition_t);
	printf("b %d\n", b);
	int c = sizeof(rb_method_iseq_t);
	printf("c %d\n", c);

	return 0;
}