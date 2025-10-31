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

From this document (begininig in chapter 5: The Thumb Instruction Set Encoding)