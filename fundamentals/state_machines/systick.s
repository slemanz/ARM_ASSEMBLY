
.equ NVIC_ST_CTRL_R,            0xE000E010
.equ NVIC_ST_RELOAD_R,          0xE000E014
.equ NVIC_ST_CURRENT_R,         0xE000E018

.equ SYSTICK_24BIT_MAX,         0x00FFFFFF
.equ ST_CTRL_EN,                (1 << 0)
.equ ST_CTRL_CLKSRC,            (1 << 2)
.equ ST_CTRL_COUNTFLG,          (1 << 16)

.equ DELAY1MS,                  16000

        .syntax	unified
        .cpu	cortex-m4
        .fpu	softvfp
        .thumb
        .section	.text
        .globl systick_init
        .globl systick_delay
        .globl systick_delay_ms

systick_init:
        /* Disable systick before configuration */
        ldr   r1, =NVIC_ST_CTRL_R /* r1 =  &NVIC_ST_CTRL_R */
        mov   r0, #0
        str   r0, [r1]

        /* Load maximum value into systick */
        ldr   r1, =NVIC_ST_RELOAD_R
        ldr   r0, =SYSTICK_24BIT_MAX
        str   r0, [r1]

        /*
        Clear SYSTICK CURRENT VALUE register
        by writing any value into it 
        */
        ldr  r1, =NVIC_ST_CURRENT_R
        mov  r0, #0
        str  r0, [r1]

        /*Select internal clock source and enable Systick*/
        ldr  r0, =NVIC_ST_CTRL_R
        ldr  r1, [r0]
        orr  r1, #ST_CTRL_CLKSRC
        orr  r1, #ST_CTRL_EN
        str  r1, [r0]

        bx   lr




        .align
        .end