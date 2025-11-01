# Assembler Rules

## ARM, Thumb, and Thumb-2

ARM, Thumb, and Thumb-2 are instruction sets for ARM processors, differing
mainly in instruction size, functionality, and performance. ARM instructions are
32-bit and typically performance-oriented, while the original Thumb instruction
set uses 16-bit instructions for better code density, though at the cost of
performance. Thumb-2 is a significant enhancement that includes both 16-bit and
32-bit instructions, offering a combination of ARM-like performance and
Thumb-like code density. 

- ARM instruction: ADD R0, R0, R2
- Thumb instruction: ADD R0, R2

Thumb-2 instruction are supported by Cortex-M

## Predefined Register Names

- r0-r15 or R0-R15
- a1-a4 (argument, result, or scratch registers, same as r0 to r3)
- sp or SP
- lr or LR
- pc or PC
- cpsr or CPSR
- spsr or SPSR
- apsr or APSR

## Directives 

- They are not instructions.
- They assist and control the assembly process.
- They are also called pseudo-ops

**Commonly used:**

- .thumb: Assemble code using thumb instruction set
- .syntax: Specifies the syntax being used
- .cpu: Specifies the cpu being used
- .section: Creates a new section
- .globl or .global: Makes an object accessible from another file
- .equ: Gives a symbolic name to a numeric value
- .end: Indicates the end of a file
- .space: Reserves a block of memory and fills it with zero
- .align: Ensures next object aligns properly
- .req: Renames register
- .byte: Allocate one-byte blocks of memory, and specify the initial contents
- .hword: Reserves a block of memory and fills it with zero
- .word: Allocate four-byte blocks of memory, and specify the initial contents.
- .space: Allocate a zeroed block of memory.
- .quad: Allocate eight-byte blocks of memory, and specify the initial contents.
