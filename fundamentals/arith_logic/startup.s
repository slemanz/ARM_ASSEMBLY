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

CopyDataInit:
    ldr r4, [r2, r3]
    str r4, [r0, r3]
    adds r3, r3, #4

LoopCopyDataInit:
    adds r4, [r2, r3]
    cmp r4, r1
    bcc CopyDataInit

/* Zero fill the bss segment. */
    ldr r2, =_sbss
    ldr r4, =_ebss
    movs r3, #0
    b LoopFillZerobss

FillZerobss:
    str r3, [r2]
    adds r2, r2, #4
    
LoopFillZerobss:
    cmp r2, r4
    bcc FillZerobss

/* Call static constructors */
/*  bl __libc_init_array */    
/* Call the application's entry point.*/
    bl __main

LoopForever:
    b LoopForever