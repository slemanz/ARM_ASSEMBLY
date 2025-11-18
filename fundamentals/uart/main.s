
.equ    RCC_BASE,           0x40023800
.equ    AHB1ENR_OFFSET,     0x30

.equ    RCC_AHB1ENR,        (RCC_BASE + AHB1ENR_OFFSET)
.equ    GPIOA_BASE,         0x40020000

.equ    APB1ENR_OFFSET,     0x40
.equ    RCC_APB1ENR,        (RCC_BASE + APB1ENR_OFFSET)

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

// active low switch
.equ    BTN_ON,             0x0000
.equ    BTN_OFF,            0x0040
.equ    BTN_PIN,            0x0040


        .syntax unified
        .cpu    cortex-m4
        .fpu    softvfp
        .thumb

        .section .text
        .global __main

__main:

/* uart_init: */
        /* 1. Enable clock access to UART GPIO pins */
        /* 2. Set UART gpio pin mode to alternate function mode */
        /* 3. Set UART gpio pin alternate funtion type to UART */
        /* 4. Enable clock access to UART2 module */
        /* 5. Set UART baudrate */
        /* 6. Configure control register 1 */
        /* 7. Configure control register 2 */
        /* 8. Configure control register 3 */
        /* 9. Enable UART module */

/* uart_outchar: */
        /* 1. Make sure UART transmit fifo is not full */
        /* 2. Write data into uart data register */

stop:
        b stop


        .align
        .end
