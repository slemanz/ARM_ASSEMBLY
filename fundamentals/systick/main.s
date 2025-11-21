.equ NVIC_ST_CTRL_R,        0xE000E010
.equ NVIC_ST_RELOAD_R,      0xE000E014
.equ NVIC_ST_CURRENT_R,     0xE000E018

.equ SYSTICK_24BIT_MAX,     0x00FFFFFF
.equ ST_CTRL_EN,            (1 << 0)
.equ ST_CTRL_CLKSRC,        (1 << 2)
.equ ST_CTRL_COUNTFLG,      (1 << 16)

.equ    RCC_BASE,           0x40023800
.equ    AHB1ENR_OFFSET,     0x30

.equ    RCC_AHB1ENR,        (RCC_BASE + AHB1ENR_OFFSET)
.equ    GPIOA_BASE,         0x40020000

.equ    MODER_OFFSET,       0x00
.equ    PUPDR_OFFSET,       0x0C
.equ    IDR_OFFSET,         0x10
.equ    ODR_OFFSET,         0x14
.equ    BSRR_OFFSET,        0x18

.equ    GPIOA_MODER,        (GPIOA_BASE + MODER_OFFSET)
.equ    GPIOA_PUPDR,        (GPIOA_BASE + PUPDR_OFFSET)
.equ    GPIOA_IDR,          (GPIOA_BASE + IDR_OFFSET)
.equ    GPIOA_ODR,          (GPIOA_BASE + ODR_OFFSET)
.equ    GPIOA_BSRR,         (GPIOA_BASE + BSRR_OFFSET)


.equ    GPIOA_EN,           (1 << 0)
.equ    MODER5_OUT,         (1 << 10)
.equ    PUPDR6_PU,          (1 << 12)
.equ    LED_ON,             (1U << 5)
.equ    LED_OFF,            (1U << 0)
.equ    ONESEC,             5333333

.equ BSRR_5_SET,            (1 << 5)
.equ BSRR_5_RESET,          (1 << 21)

.equ DELAY1MS,              16000


        .syntax unified
        .cpu    cortex-m4
        .fpu    softvfp
        .thumb

        .section .text
        .global __main

/*Default frequency =  16Mhz =>  16 0000 0000 cycles/second
 1 millisecond  =  16 0000 */

__main:
        bl      gpioa_init

loop:
        b       loop

gpioa_init:
        /* enable clock access to gpioa */
        ldr r0, =RCC_AHB1ENR
        ldr r1, [r0]
        orr r1, #GPIOA_EN
        str r1, [r0]

        /* set PA5 as output */
        ldr r0, =GPIOA_MODER
        ldr r1, [r0]
        orr r1, #MODER5_OUT
        str r1, [r0]

        mov r1, #0
        ldr r2, =GPIOA_ODR
        bx  lr

stop:
        b stop


        .align
        .end
