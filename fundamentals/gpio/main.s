
.equ    RCC_BASE,           0x40023800
.equ    AHB1ENR_OFFSET,     0x30

.equ    RCC_AHB1ENR,        (RCC_BASE + AHB1ENR_OFFSET)
.equ    GPIOA_BASE,         0x40020000

.equ    GPIOA_MODER_OFFSET, 0x00
.equ    GPIOA_ODR_OFFSET,   0x14

.equ    GPIOA_MODER,        (GPIOA_BASE + GPIOA_MODER_OFFSET)
.equ    GPIOA_ODR,          (GPIOA_BASE + GPIOA_ODR_OFFSET)


.equ    GPIOA_EN,           (1 << 0)
.equ    MODER5_OUT,         (1 << 10)
.equ    LED_ON,             (1U << 5)

        .syntax unified
        .cpu    cortex-m4
        .fpu    softvfp
        .thumb

        .section .text
        .global __main

__main:
        /* ENABLE CLOCK ACCESS TO GPIOA */
        // point r0 to RCC_AHB1ENR
        ldr r0, =RCC_AHB1ENR

        // load value at address found in r0 into r1
        ldr r1, [r0]

        orr r1, #GPIOA_EN

        // store content in r1 at address found in r0
        str r1, [r0]

        // set PA5 as output
        ldr r0, =GPIOA_MODER
        ldr r1, [r0]
        orr r1, #MODER5_OUT
        str r1, [r0]

        // set PA5 high
        ldr r0, =GPIOA_ODR
        ldr r1, =LED_ON
        str r1, [r0]

stop:
        b   stop
        .align
        .end
