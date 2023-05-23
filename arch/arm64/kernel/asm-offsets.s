	.arch armv8-a
	.file	"asm-offsets.c"
// GNU C17 (Ubuntu 9.3.0-10ubuntu1) version 9.3.0 (aarch64-linux-gnu)
//	compiled by GNU C version 9.3.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

// GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
// options passed:  -nostdinc -I include -I include/std
// -I /home/rlk/rlk/OpenOS/arch/arm64/include
// -I arch/arm64/include/generated/uapi -I arch/arm64/include/generated
// -I arch/arm64/include/asm -I include
// -I /home/rlk/rlk/OpenOS/arch/arm64/include/uapi
// -I arch/arm64/include/generated/uapi
// -I /home/rlk/rlk/OpenOS/include/uapi -I include/generated/uapi
// -I include -I include/std -I /home/rlk/rlk/OpenOS/arch/arm64/include
// -I arch/arm64/include/generated/uapi -I arch/arm64/include/generated
// -I arch/arm64/include/asm -I include
// -I /home/rlk/rlk/OpenOS/arch/arm64/include/uapi
// -I arch/arm64/include/generated/uapi
// -I /home/rlk/rlk/OpenOS/include/uapi -I include/generated/uapi
// -imultiarch aarch64-linux-gnu -D __KERNEL__ -D KBUILD_CONF
// -include /home/rlk/rlk/OpenOS/include/target/config.h
// -include /home/rlk/rlk/OpenOS/include/target/config.h
// -MD arch/arm64/kernel/.asm-offsets.s.d arch/arm64/kernel/asm-offsets.c
// -mlittle-endian -mabi=lp64
// -auxbase-strip arch/arm64/kernel/asm-offsets.s -g -g -Wall
// -fomit-frame-pointer -fverbose-asm -fasynchronous-unwind-tables
// -Wformat-security -fstack-clash-protection
// options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
// -fassume-phsa -fasynchronous-unwind-tables -fauto-inc-dec -fcommon
// -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
// -feliminate-unused-debug-types -ffp-int-builtin-inexact -ffunction-cse
// -fgcse-lm -fgnu-runtime -fgnu-unique -fident -finline-atomics
// -fipa-stack-alignment -fira-hoist-pressure -fira-share-save-slots
// -fira-share-spill-slots -fivopts -fkeep-static-consts
// -fleading-underscore -flifetime-dse -flto-odr-type-merging -fmath-errno
// -fmerge-debug-strings -fomit-frame-pointer -fpeephole -fplt
// -fprefetch-loop-arrays -freg-struct-return
// -fsched-critical-path-heuristic -fsched-dep-count-heuristic
// -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
// -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
// -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
// -fshow-column -fshrink-wrap-separate -fsigned-zeros
// -fsplit-ivs-in-unroller -fssa-backprop -fstack-clash-protection
// -fstdarg-opt -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math
// -ftree-cselim -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im
// -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
// -ftree-phiprop -ftree-reassoc -ftree-scev-cprop -funit-at-a-time
// -funwind-tables -fverbose-asm -fzero-initialized-in-bss
// -mfix-cortex-a53-835769 -mfix-cortex-a53-843419 -mglibc -mlittle-endian
// -momit-leaf-frame-pointer -mpc-relative-literal-loads

	.text
.Ltext0:
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.file 1 "arch/arm64/kernel/asm-offsets.c"
	.loc 1 25 1
	.cfi_startproc
// arch/arm64/kernel/asm-offsets.c:26: 	return 0;
	.loc 1 26 9
	mov	w0, 0	// _1,
// arch/arm64/kernel/asm-offsets.c:27: }
	.loc 1 27 1
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x4f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF0
	.byte	0xc
	.4byte	.LASF1
	.4byte	.LASF2
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x18
	.byte	0x5
	.4byte	0x4b
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"/home/rlk/rlk/OpenOS"
.LASF0:
	.string	"GNU C17 9.3.0 -mlittle-endian -mabi=lp64 -g -g -fomit-frame-pointer -fasynchronous-unwind-tables -fstack-clash-protection"
.LASF3:
	.string	"main"
.LASF1:
	.string	"arch/arm64/kernel/asm-offsets.c"
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu1) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
