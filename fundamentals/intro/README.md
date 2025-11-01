# Introduction to ARM Architecture

```
┌────────────────┐              ┌────────────────┐
│                │              │┌──────────────┐│
│                │              ││     CODE     ││
│   PROCESSOR    │ ―― ADDRESS ―→│└──────────────┘│
│                │ ←――――――――――――│┌──────────────┐│
│                │              ││     DATA     ││
│                │              │└──────────────┘│
└────────────────┘              └────────────────┘
```

**The number Systems:** 

- Base 10 Counting:  0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
- Base 2 Counting:  0, 1, 10, 11, 100, 101, 110, 111, 1000, 1001, 1010
- Base 16 Counting:  0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F

## Bits to Commands

- mnemonic:

```
0xE0CC31B0      STRH    sum, [pointer], #16
0x1AFFFFF1      loop_one
0xE3A0D008      count, #8
```

The best refernce: [ARMv7-M Architecture Reference Manual](https://developer.arm.com/documentation/ddi0403/latest/)

From this document (begininig in chapter 5: The Thumb Instruction Set Encoding),
we can decode this instruction set that is in memory:

in `mem8 0x08000008 4` = 0x4F 0xF0 0x64 0x01

As it is little endian and thumb instruction set, we can have two half words:

0xF04F 0x0164

In binary:

```
0xF04F = 0b11110000 01001111
0x0164 = 0b00000001 01100100
```

![image](image_01.png)

As the bits \[15:11\] of the first halfword are `0b11110`, it is a 32-bit thumb instruction.

![image](image_02.png)

So, we will have:

- op1: `0b10`
- op2: `0b0000100`
- op: `0b0`

It's an Data processing (modified immediate) instruction class:

![image](image_03.png)

Rd means Destination Register and Rn means First Source Operand Register.

- Op: `0b00100`
- Rn: `0b1111`
- Rd: `0b0001` - (R1)

It's an Move (immediate) Instruction:

![image](image_04.png)

Using encoding T2:

- i = 0
- S = 0
- imm3 = 0
- Rd = `0b0001` (R1)
- imm8 = 100

imm stands for immediate value.

The final instructions is: `mov r1, #100`

# The RISC and ARM Design Philosoohy

ARM does not manufacture processors.

**RISC** - Reduced Instruction Set Computer
**CISC** - Complex Instruction Set Computer

In RISC:

- Instructions: Reduced number of instructions.
- Pipelines: Instructions are executed in parallel by pipelines.
- Registers: Large general-purpose register set.
- Load-Store: Processor operates on data held in registers.

ARM mix RISC, High Code Density and Power Eficiency together.


