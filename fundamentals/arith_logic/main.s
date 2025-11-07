.syntax unified
.cpu    cortex-m4
.fpu    softvfp
.thumb

.global __main

.thumb_func

__main:
        mov r5, #0x10
        mov r3, #0x10

        add r6, r5, r3

stop:
        b   stop
        .align
        .end
