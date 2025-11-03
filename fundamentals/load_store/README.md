# Load-Store Instructions

ARM uses load-store instructions, like LDR (load) and STR (store), to move data
between memory and registers. 

## Bit size

Bit size allows the CPU to address memory for an individual process.

X-bit can handle $2^X$ bytes of memory.

The higher the bit size, the higher performance.

## Frequently used Load/Store Instructions

| LOAD | STORE | Size and Type |
|---|---|---|
| LDR   | STR   | 32-bits           |
| LDRB  | STRB  | 8-bits (byte)     |
| LDRH  | STRH  | 16-bits(Halfword) |
| LDRSB |       | Signed byte       |
| LDRSH |       | Signed halfword   |
| LDM   | SDM   | Multiple words    |


Load: Take value from memory write to register
- `LDR {size} {cond} <Rd>, <addressing_mode>`

Store: Read value from register write to memory
- `STR {size} {cond} <Rd>, <addressing_mode>`

### Example 

The `LDRH r1, [r0]` instruction in ARM assembly loads a halfword (16 bits) from
memory into a register.

Example:

Consider the following scenario:
- Register r0 contains the memory address 0x20008000.
- The memory location at 0x20008000 contains the byte 0xEF.
- The memory location at 0x20008001 contains the byte 0xCD.
- Register r1 initially contains 0x12345678.

When the instruction `LDRH r1, [r0]` is executed:
- The processor reads the 16-bit halfword from the memory address specified by
r0, which is 0x20008000.
- Assuming a little-endian system, the halfword at 0x20008000 would be 0xCDEF
(byte 0xEF at 0x20008000 and byte 0xCD at 0x20008001).
- This 16-bit value (0xCDEF) is then loaded into the lower 16 bits of r1.
- The upper 16 bits of r1 are cleared (zero-extended) to ensure the entire
32-bit register is correctly populated.

Therefore, after the execution of `LDRH r1, [r0]`, the value in r1 would become
0x0000CDEF.