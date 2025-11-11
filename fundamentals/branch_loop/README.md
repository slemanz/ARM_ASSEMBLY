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

Example:

```
CMP r0, r1 
BLT level2 ; jump to label level2 (r0 < r1)
```

### Compare and Branch

In ARM assembly, comparing and branching typically involves two main types of
instructions:

1. **Comparison Instructions (e.g., CMP, CMN):**
- These instructions perform an arithmetic or logical operation (like
subtraction for CMP) on two operands and update the condition flags in the
Current Program Status Register (CPSR).
- They do not store the result of the operation in a register.
- The condition flags (N, Z, C, V) indicate properties of the result, such as
whether it's negative, zero, if a carry/borrow occurred, or if an overflow
happened.

2. **Branch Instructions (e.g., B, BEQ, BNE):**

- These instructions alter the program's flow of execution by jumping to a
specified label.
- Unconditional branches: (B or BAL) always jump to the target label.
- Conditional branches: (e.g., BEQ, BNE, BGT, BLT) only jump if a specific
condition, determined by the state of the CPSR condition flags, is met.

3. **Combined Instructions (e.g., CBZ, CBNZ):**

- Modern ARM architectures (AArch64 and some Thumb-2) offer combined
instructions like CBZ (Compare and Branch on Zero) and CBNZ (Compare and Branch
on Non-Zero).
- These instructions compare a register's value with zero and conditionally
branch based on the result in a single instruction. They do not affect the
condition flags.

Examples:

```
CMP r2,#0 ; compare content of r2 and zero
BEQ delay ; branch to delay if content of r2 equal zero
```

```
CBZ r2, delay ; branch to delay if content of r2 equal zero
```




