	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_xcheri0p0"
	.file	"subp.c"
                                        # Start of file scope inline assembly
.symver __qsort_r_compat, qsort_r@FBSD_1.0

                                        # End of file scope inline assembly
	.file	1 "/cheruby-purecap/src/output/rootfs-riscv64-purecap/research/sakuranbo/build/relevant2/test" "subp.c"
	.file	2 "/cheruby-purecap/src/output/rootfs-riscv64-purecap" "usr/include/sys/_types.h"
	.file	3 "/cheruby-purecap/src/output/rootfs-riscv64-purecap" "usr/include/sys/_stdint.h"
	.globl	func                            # -- Begin function func
	.p2align	1
	.type	func,@function
func:                                   # @func
.Lfunc_begin0:
	.loc	1 5 0                           # subp.c:5:0
	.cfi_startproc
# %bb.0:                                # %entry
	cincoffset	csp, csp, -80
	.cfi_def_cfa_offset 80
	csc	cra, 64(csp)                    # 16-byte Folded Spill
	csc	cs0, 48(csp)                    # 16-byte Folded Spill
	.cfi_offset ra, -16
	.cfi_offset s0, -32
	cincoffset	cs0, csp, 80
	.cfi_def_cfa s0, 0
	csc	ca0, -48(cs0)
	li	a0, 40
.Ltmp0:
	.loc	1 6 21 prologue_end             # subp.c:6:21
	ccall	malloc
	.loc	1 6 7 is_stmt 0                 # subp.c:6:7
	csc	ca0, -64(cs0)
	.loc	1 7 18 is_stmt 1                # subp.c:7:18
	clc	ca0, -64(cs0)
	.loc	1 7 25 is_stmt 0                # subp.c:7:25
	clc	ca1, -48(cs0)
                                        # kill: def $x11 killed $x11 killed $c11
                                        # kill: def $x10 killed $x10 killed $c10
	.loc	1 7 23                          # subp.c:7:23
	sub	a0, a0, a1
	srai	a0, a0, 2
	.loc	1 7 14                          # subp.c:7:14
	csd	a0, -72(cs0)
	.loc	1 8 24 is_stmt 1                # subp.c:8:24
	cld	a0, -72(cs0)
	.loc	1 8 2 is_stmt 0                 # subp.c:8:2
	cmove	ca1, csp
	csd	a0, 0(ca1)
.LBB0_1:                                # %entry
                                        # Label of block must be emitted
	auipcc	ca0, %captab_pcrel_hi(.L.str)
	clc	ca0, %pcrel_lo(.LBB0_1)(ca0)
	ccall	printf
	.loc	1 9 1 is_stmt 1                 # subp.c:9:1
	clc	cra, 64(csp)                    # 16-byte Folded Reload
	clc	cs0, 48(csp)                    # 16-byte Folded Reload
	cincoffset	csp, csp, 80
	cret
.Ltmp1:
.Lfunc_end0:
	.size	func, .Lfunc_end0-func
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
.Lfunc_begin1:
	.loc	1 11 0                          # subp.c:11:0
	.cfi_startproc
# %bb.0:                                # %entry
	cincoffset	csp, csp, -112
	.cfi_def_cfa_offset 112
	csc	cra, 96(csp)                    # 16-byte Folded Spill
	csc	cs0, 80(csp)                    # 16-byte Folded Spill
	.cfi_offset ra, -16
	.cfi_offset s0, -32
	cincoffset	cs0, csp, 112
	.cfi_def_cfa s0, 0
	li	a0, 0
	csd	a0, -96(cs0)                    # 8-byte Folded Spill
	csw	a0, -36(cs0)
	li	a0, 40
.Ltmp2:
	.loc	1 12 21 prologue_end            # subp.c:12:21
	csd	a0, -104(cs0)                   # 8-byte Folded Spill
	ccall	malloc
	cmove	ca1, ca0
	.loc	1 12 7 is_stmt 0                # subp.c:12:7
	cld	a0, -104(cs0)                   # 8-byte Folded Reload
	csc	ca1, -64(cs0)
	.loc	1 13 18 is_stmt 1               # subp.c:13:18
	ccall	malloc
	.loc	1 13 7 is_stmt 0                # subp.c:13:7
	csc	ca0, -80(cs0)
	.loc	1 14 47 is_stmt 1               # subp.c:14:47
	clc	ca2, -80(cs0)
.LBB1_1:                                # %entry
                                        # Label of block must be emitted
	.loc	1 14 34 is_stmt 0               # subp.c:14:34
	auipcc	ca0, %captab_pcrel_hi(func)
	clc	ca0, %pcrel_lo(.LBB1_1)(ca0)
	mv	a1, a0
	mv	a2, a2
	sub	a1, a1, a2
	csetaddr	ca0, ca0, a1
	.loc	1 14 18                         # subp.c:14:18
	mv	a0, a0
	.loc	1 14 14                         # subp.c:14:14
	csd	a0, -88(cs0)
	.loc	1 15 24 is_stmt 1               # subp.c:15:24
	cld	a0, -88(cs0)
	.loc	1 15 2 is_stmt 0                # subp.c:15:2
	cmove	ca1, csp
	csd	a0, 0(ca1)
.LBB1_2:                                # %entry
                                        # Label of block must be emitted
	auipcc	ca0, %captab_pcrel_hi(.L.str)
	clc	ca0, %pcrel_lo(.LBB1_2)(ca0)
	ccall	printf
                                        # kill: def $x11 killed $x10
	.loc	1 16 2 is_stmt 1                # subp.c:16:2
	cld	a0, -96(cs0)                    # 8-byte Folded Reload
	clc	cra, 96(csp)                    # 16-byte Folded Reload
	clc	cs0, 80(csp)                    # 16-byte Folded Reload
	cincoffset	csp, csp, 112
	cret
.Ltmp3:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"addr: %ld\n"
	.size	.L.str, 11

	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	14                              # DW_FORM_strp
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	16                              # DW_AT_stmt_list
	.byte	6                               # DW_FORM_data4
	.byte	27                              # DW_AT_comp_dir
	.byte	14                              # DW_FORM_strp
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	1                               # DW_FORM_addr
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	2                               # DW_AT_location
	.byte	10                              # DW_FORM_block1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	1                               # DW_FORM_addr
	.byte	64                              # DW_AT_frame_base
	.byte	10                              # DW_FORM_block1
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	12                              # DW_FORM_flag
	.byte	63                              # DW_AT_external
	.byte	12                              # DW_FORM_flag
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	10                              # DW_FORM_block1
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	10                              # DW_FORM_block1
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	1                               # DW_FORM_addr
	.byte	64                              # DW_AT_frame_base
	.byte	10                              # DW_FORM_block1
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	12                              # DW_FORM_flag
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.half	2                               # DWARF version number
	.word	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	8                               # Address Size (in bytes)
	.byte	1                               # Abbrev [1] 0xb:0x131 DW_TAG_compile_unit
	.word	.Linfo_string0                  # DW_AT_producer
	.half	12                              # DW_AT_language
	.word	.Linfo_string1                  # DW_AT_name
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.word	.Linfo_string2                  # DW_AT_comp_dir
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.quad	.Lfunc_end1                     # DW_AT_high_pc
	.byte	2                               # Abbrev [2] 0x2e:0x11 DW_TAG_variable
	.word	63                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	8                               # DW_AT_decl_line
	.byte	9                               # DW_AT_location
	.byte	3
	.quad	.L.str
	.byte	3                               # Abbrev [3] 0x3f:0xc DW_TAG_array_type
	.word	75                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x44:0x6 DW_TAG_subrange_type
	.word	82                              # DW_AT_type
	.byte	11                              # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0x4b:0x7 DW_TAG_base_type
	.word	.Linfo_string3                  # DW_AT_name
	.byte	8                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0x52:0x7 DW_TAG_base_type
	.word	.Linfo_string4                  # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	7                               # Abbrev [7] 0x59:0x6 DW_TAG_pointer_type
	.word	95                              # DW_AT_type
	.byte	16                              # DW_AT_byte_size
	.byte	5                               # Abbrev [5] 0x5f:0x7 DW_TAG_base_type
	.word	.Linfo_string5                  # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x66:0xb DW_TAG_typedef
	.word	113                             # DW_AT_type
	.word	.Linfo_string9                  # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	86                              # DW_AT_decl_line
	.byte	8                               # Abbrev [8] 0x71:0xb DW_TAG_typedef
	.word	124                             # DW_AT_type
	.word	.Linfo_string8                  # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	76                              # DW_AT_decl_line
	.byte	9                               # Abbrev [9] 0x7c:0x9 DW_TAG_typedef
	.word	133                             # DW_AT_type
	.word	.Linfo_string7                  # DW_AT_name
	.byte	5                               # Abbrev [5] 0x85:0x7 DW_TAG_base_type
	.word	.Linfo_string6                  # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	16                              # DW_AT_byte_size
	.byte	10                              # Abbrev [10] 0x8c:0x47 DW_TAG_subprogram
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.quad	.Lfunc_end0                     # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string10                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.byte	1                               # DW_AT_prototyped
	.byte	1                               # DW_AT_external
	.byte	11                              # Abbrev [11] 0xa7:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	80
	.word	.Linfo_string12                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	89                              # DW_AT_type
	.byte	12                              # Abbrev [12] 0xb5:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	64
	.word	.Linfo_string13                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.word	89                              # DW_AT_type
	.byte	12                              # Abbrev [12] 0xc3:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.word	.Linfo_string14                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.word	286                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	13                              # Abbrev [13] 0xd3:0x4b DW_TAG_subprogram
	.quad	.Lfunc_begin1                   # DW_AT_low_pc
	.quad	.Lfunc_end1                     # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string11                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	11                              # DW_AT_decl_line
	.word	95                              # DW_AT_type
	.byte	1                               # DW_AT_external
	.byte	12                              # Abbrev [12] 0xf1:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	64
	.word	.Linfo_string13                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	12                              # DW_AT_decl_line
	.word	89                              # DW_AT_type
	.byte	12                              # Abbrev [12] 0xff:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.word	.Linfo_string12                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	13                              # DW_AT_decl_line
	.word	89                              # DW_AT_type
	.byte	12                              # Abbrev [12] 0x10e:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.word	.Linfo_string14                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.word	286                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x11e:0xb DW_TAG_typedef
	.word	297                             # DW_AT_type
	.word	.Linfo_string17                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	108                             # DW_AT_decl_line
	.byte	8                               # Abbrev [8] 0x129:0xb DW_TAG_typedef
	.word	308                             # DW_AT_type
	.word	.Linfo_string16                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	50                              # DW_AT_decl_line
	.byte	5                               # Abbrev [5] 0x134:0x7 DW_TAG_base_type
	.word	.Linfo_string15                 # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 15.0.0 (https://github.com/CTSRD-CHERI/llvm-project.git 578ea4f7ef67d589f0ca7d10ec9e383333567421)" # string offset=0
.Linfo_string1:
	.asciz	"subp.c"                        # string offset=112
.Linfo_string2:
	.asciz	"/cheruby-purecap/src/output/rootfs-riscv64-purecap/research/sakuranbo/build/relevant2/test" # string offset=119
.Linfo_string3:
	.asciz	"char"                          # string offset=210
.Linfo_string4:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=215
.Linfo_string5:
	.asciz	"int"                           # string offset=235
.Linfo_string6:
	.asciz	"unsigned __intcap"             # string offset=239
.Linfo_string7:
	.asciz	"__uintcap_t"                   # string offset=257
.Linfo_string8:
	.asciz	"__uintptr_t"                   # string offset=269
.Linfo_string9:
	.asciz	"uintptr_t"                     # string offset=281
.Linfo_string10:
	.asciz	"func"                          # string offset=291
.Linfo_string11:
	.asciz	"main"                          # string offset=296
.Linfo_string12:
	.asciz	"p"                             # string offset=301
.Linfo_string13:
	.asciz	"addr"                          # string offset=303
.Linfo_string14:
	.asciz	"s"                             # string offset=308
.Linfo_string15:
	.asciz	"long"                          # string offset=310
.Linfo_string16:
	.asciz	"__int64_t"                     # string offset=315
.Linfo_string17:
	.asciz	"__ptrdiff_t"                   # string offset=325
	.ident	"clang version 15.0.0 (https://github.com/CTSRD-CHERI/llvm-project.git 578ea4f7ef67d589f0ca7d10ec9e383333567421)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym func
	.addrsig_sym malloc
	.addrsig_sym printf
	.section	.debug_line,"",@progbits
.Lline_table_start0:
