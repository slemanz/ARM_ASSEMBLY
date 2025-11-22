
        .section .data

putPt       .space      4   /* Allocate 4 bytes of memory filled with zeros */
getPt       .space      4   /* Allocate 4 bytes of memory filled with zeros */

.equ        SIZE,       8
fifo:       .space      SIZE /* fifo can accept size-1 items */

.equ        fifo_addr,      fifo            /* Address of fifo */
.equ        fifo_end_addr   fifo + SIZE
.equ        putPt_addr,     putPt           /* Put pointer address */
.equ        getPt_addr,     getPt           /* Get pointer address */

        .syntax unified
        .cpu    cortex-m4
        .fpu    softvfp
        .thumb
        .section .text

fifo_init:
        /* Set putPt and getPt to fifo_addr */
        ldr     r0, =fifo_addr
        ldr     r1, =putPt_addr
        str     r0, [r1]

        ldr     r1, =getPt_addr
        str     r0, [r1]

        bx lr