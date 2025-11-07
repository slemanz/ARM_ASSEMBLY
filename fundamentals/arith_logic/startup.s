/* Startup STM32F411 */

.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

.global g_pfnVectors
.global Default_Handler

/* LInker. */
.word _la_data
.word _sdata
.word _edata
.word _sbss
.word _ebss

    .section .text.Reset_Handler
    .weak Reset_Handler
    .type Reset_Handler, %function
Reset_Handler:
    ldr r0, =_estack
    mov sp, r0 /* Set the stack pointer */

    /* Copy data segment from flash to sram */
    ldr r0, =_sdata
    ldr r1, =_edata
    ldr r2, =_la_data
    movs r3, #0
    b LoopCopyDataInit