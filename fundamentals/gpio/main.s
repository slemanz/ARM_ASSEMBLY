
.equ    RCC_BASE,           0x40023800
.equ    AHB1ENR_OFFSET,     0x30

.equ    RCC_AHB1ENR,        (RCC_BASE + AHB1ENR_OFFSET)
.equ    GPIOA_BASE,         0x40020000

.equ    GPIOA_MODER_OFFSET, 0x00
.equ    GPIOA_ODR_OFFSET,   0x14

.equ    GPIO_MODER,         (GPIOA_BASE + GPIOA_MODER_OFFSET)
.equ    GPIO_ODR,           (GPIOA_BASE + GPIOA_ODR_OFFSET)


.equ    GPIOA_EN            (1 << 0)
.equ    MODER6_OUT          (1 << 12)
.equ    LED_ON,             (1U << 6)

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
