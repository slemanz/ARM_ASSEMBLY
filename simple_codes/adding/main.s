.syntax unified
.cpu    cortex-m4
.fpu    softvfp
.thumb

.global Reset_Handler

.word 0x20010000
.word Reset_Handler

.section .text

.thumb_func
Reset_Handler:
    mov r1, #100
    mov r2, #100

    add r3, r1, r2

stop:
    b   stop
    .align
    .end
