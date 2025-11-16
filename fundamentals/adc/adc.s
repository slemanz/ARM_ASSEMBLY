        
.equ RCC_BASE,              0x40023800
.equ AHB1ENR_OFFSET,        0x30

.equ RCC_AHB1ENR,           (RCC_BASE + AHB1ENR_OFFSET)
.equ GPIOA_BASE,            0x40020000

.equ APB2ENR_OFFSET,        (0x44)
.equ RCC_APB2ENR,           (RCC_BASE + APB2ENR_OFFSET)



.equ ADC1_BASE,             0x40012000

.equ ADC1_CR2_OFFSET,       0x08
.equ ADC1_CR2,              (ADC1_BASE + ADC1_CR2_OFFSET)

.equ ADC1_SQR3_OFFSET       0x34
.equ ADC1_SQR3,             (ADC1_BASE + ADC1_SQR3)

.equ ADC1_SQR1_OFFSET,      0x2C
.equ ADC1_SQR1,             (ADC1_BASE + ADC1_SQR1_OFFSET)

.equ ADC1_SR_OFFSET,        0x00
.equ ADC1_SR,               (ADC1_BASE + ADC1_SR_OFFSET)

.equ ADC1_DR_OFFSET,        0x4C
.equ ADC1_DR,               (ADC1_BASE + ADC1_DR_OFFSET)

.equ MODER_OFFSET,          0x00
.equ GPIOA_MODER,           (GPIOA_BASE + MODER_OFFSET)

.equ BSRR_OFFSET,           0x14
.equ GPIOA_ODR,             (GPIOA_BASE + ODR_OFFSET)



.equ GPIOA_EN,              (1 << 0)
.equ ADC1_EN                (1 << 8)
.equ SQR3_CNF,              1  /*Conversion sequence starts at ch1*/
.equ SQR1_CNF,              0  /*Conversion sequence length to 1*/
.equ CR2_ADCON,             (1 << 0)
.equ CR2_SWSTART,           (1 << 30)
.equ SR_EOC,                (1 << 1)	

.equ MODER5_OUT,            (1<<10)
.equ LED_ON,                (1U<<5)
.equ LED_OFF,               (1<<0)
.equ ONESEC,                5333333

.equ SENS_THRESH,           3000

.equ BSRR_5_SET,            (1<<5)
.equ BSRR_5_RESET,          (1<<21)

.equ  MODER1_ANLG_SLT,      0xC


        .syntax unified
        .cpu    cortex-m4
        .fpu    softvfp
        .thumb

        .section .text
        .global __main

__main:

/* adc_init: */
        /* 1. Enable clock access to ADC pin's GPIO port */
        /* 2. Set ADC pin, PA as analog pin */
        /* 3. Enable clock access to the ADC */
        /* 4. select software trigger */
        /* 5. Set conversion sequence starting channel */
        /* 6. Set conversion sequence length */
        /* Enable adc module */

/* adc_read: */
        /* 1. Start conversion */
        /* 2. Wait for the conversion to be complete */
        /* 3. Read content of ADC data register */

stop:
        b stop


        .align
        .end
