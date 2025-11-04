# Constants and Literal Pools

In ARM assembly, constants are immediate values or symbolic definitions used
directly in instructions or as fixed values. Literal pools are a mechanism used
by the assembler to store constant data (especially large or arbitrary 32-bit
values and addresses) in a memory area within the code section, from which they
can be loaded into registers using PC-relative LDR instructions. 

## Loading constants into memory

Loading constants into memory in ARM assembly can be accomplished using several
methods, depending on the size and type of the constant.

For arbitrary 32-bit or larger constants, or when the constant is stored in a
data section, LDR (Load Register) is used to load the value from a memory
address into a register. This often involves using a literal pool or a
PC-relative load.

**Example (GNU Assembler):**

```
ldr r0, =0x12345678 ; Load the 32-bit constant 0x12345678 into r0
```

Also can be direct loading with MOV and MVN.

MOV (Move): This instruction allows loading immediate 16-bit constants directly
into a register (in ARMv7 and later, using movw for the lower 16 bits and movt
for the upper 16 bits of a 32-bit constant). For older ARM architectures or
smaller constants in Thumb mode, a single MOV can load constants within a
specific range (e.g., 0-255 for 16-bit Thumb MOV).

MVN (Move Not): This instruction loads the bitwise NOT of an immediate constant
into a register. This can be useful for loading certain constants that are the
inverse of a value loadable by MOV.

```
movw r0, #0x5678    ; Load lower 16 bits of the constant into r0
movt r0, #0x1234    ; Load upper 16 bits of the constant into r0 (r0 now holds 0x12345678)
```

