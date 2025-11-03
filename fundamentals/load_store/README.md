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