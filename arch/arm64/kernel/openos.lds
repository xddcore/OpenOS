/*
 * Automatically generated C config: don't edit
 * OpenOS version: 0.0.1
 * Thu May 25 14:53:22 2023
 */
/* Three system performance ? should be considered carefully to choose the
 * software architecture model:
 * 1. throughput: IO throughput should be as great as possible
 * 2. realtime: time critical tasks can be run on time
 * 3. faireness: tasks can be distributed fairly on difference computing
 *               resources
 * Systems will always take throughput into account, realtime and fairness
 * are left for users' choices.
 */
OUTPUT_ARCH(aarch64)
ENTRY(_start)
SECTIONS
{
 . = 0x80000;
 .text.boot : { *(.text.boot) }
 .text : { *(.text) }
 .rodata : { *(.rodata) }
 .data : { *(.data) }
 . = ALIGN(0x8);
 bss_begin = .;
 .bss : { *(.bss*) }
 bss_end = .;
}
