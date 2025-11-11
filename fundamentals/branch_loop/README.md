# Branch and Loop Instructions

ARM assembly language utilizes branching and loops to control the flow of
program exec   ution, enabling conditional logic and repetitive operations.

## Fetch - Decode - Execute

The Fetch-Decode-Execute (FDE) cycle is the fundamental process by which a CPU,
including an ARM processor, executes instructions from a program. It is a
continuous loop, repeated for each instruction until the program finishes or is
interrupted.

## Branching

Branching instructions alter the program counter (PC), causing execution to jump
to a different location in the code.

**Unconditional Branch (B):**
- The B instruction branches to a specified label unconditionally, similar to a
goto statement in high-level languages.

**Conditional Branch (Bcc):**
- Conditional branch instructions execute only if a specific condition is met,
based on the status of the NZCV condition flags in the PSTATE register. These
flags are set by instructions like CMP (compare) or SUBS (subtract and set
flags).
- Examples include BEQ (Branch if Equal), BNE (Branch if Not Equal), BGT (Branch
if Greater Than), BLT (Branch if Less Than), etc.

**Branch with Link (BL):**
- The BL instruction is used for function calls. It branches to a specified
label and stores the return address (the address of the instruction immediately
following the BL instruction) in the Link Register 

| Field Mnemonic | Condition Flags | Meaning | Code |
|---|---|---|---|
| EQ    | Z set     | Equal         | 0000 |
| NE    | Z clear   | Not equal     | 0001 |
| CS/CH | C set     | Unsigned >=   | 0010 |
| CC/LO | C clear   | Unsigned <    | 0011 |
| MI    | N set     | Negative      | 0100 |
| PL    | N clear   | Positive or zero | 0101 |
| VS    | V set     | Overflow      | 0110 |
| VC    | V clear   | No overflow   | 0111 |
| HI    | C set and Z clear | Unsigned > |1000 |
| LS    | C clear and Z set | Unsigned <= |1001 |
| GE    | N >= V    | Signed >=     | 1010 |
| LT    | N != V    | Signed <      | 1011 |
| GT    | Z clear, N == V | Signed > | 1100 |
| LE    | Z set, N != V | Signed <= | 1101 |
| AL    | Always    | Default       | 1110 |

