# Assembler Rules

## ARM, Thumb, and Thumb-2

ARM, Thumb, and Thumb-2 are instruction sets for ARM processors, differing
mainly in instruction size, functionality, and performance. ARM instructions are
32-bit and typically performance-oriented, while the original Thumb instruction
set uses 16-bit instructions for better code density, though at the cost of
performance. Thumb-2 is a significant enhancement that includes both 16-bit and
32-bit instructions, offering a combination of ARM-like performance and
Thumb-like code density. 

- ARM instruction: ADD RO, RO, R2
- Thumb instruction: ADD RO, R2

Thumb-2 instruction are supported by Cortex-M