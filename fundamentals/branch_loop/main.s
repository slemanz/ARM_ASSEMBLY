
        .syntax unified
        .cpu    cortex-m4
        .fpu    softvfp
        .thumb

        .section .text
        .global __main


__main:

stop:
        b   stop
        .align
        .end
