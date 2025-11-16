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
