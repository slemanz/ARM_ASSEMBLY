.syntax unified
.cpu    cortex-m4
.fpu    softvfp
.thumb
.section .text


__main:
    mov r5, #45
    mov r3, #45

    add r6, r5, r3

stop:
    b   stop