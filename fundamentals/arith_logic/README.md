# Arithmetic and Logic Instruction

ARM assembly language includes a comprehensive set of arithmetic and logic
instructions for manipulating data within registers. These instructions are
fundamental for performing computations and controlling program flow.

## Flags

In ARM assembly, there are four condition code flags (N, Z, C, V) found in the
Application Program Status Register (APSR) or Program
Status Register (PSR). These flags are updated by arithmetic and logical
operations, particularly when the 'S' suffix is used with an instruction (e.g.,
ADDS, SUBS, ANDS). They are crucial for conditional execution and branching
based on the result of an operation.

### N Flag (Negative Flag):

- The N flag is set to 1 when the result of an operation, interpreted as a
signed two's-complement integer, is negative. 
- It is cleared to 0 if the result is positive or zero. 
- Essentially, the N flag reflects the most significant bit (MSB) of the result:
if the MSB is 1, the N flag is 1; if the MSB is 0, the N flag is 0.

### V Flag (Overflow Flag):

- The V flag is set to 1 when an arithmetic operation on signed numbers results
in an overflow.
- Signed overflow occurs when the result of an operation is too large to be
represented in the available number of bits for a signed integer, causing the
sign bit to be incorrectly set.
- For example, adding two positive numbers might result in a negative number if
overflow occurs, or adding two negative numbers might result in a positive
number.
- The V flag is cleared to 0 if no signed overflow occurs.

### C flag (Carry)

- For unsigned arithmetic. It signals an "unsigned overflow".
- Addition: Set to 1 if an addition produces a carry out of the most significant
bit (i.e., the result is too large to fit in 32 bits).
- Subtraction: Set to 1 if there is no borrow. This is equivalent to A - B
without a borrow, which means A is greater than or equal to B in unsigned terms.
- Logical Shift: Can be updated by a bit shifted out of the register. 

### Z flag (Zero)

- To check for a zero result.
- Condition: Set to 1 if the result of an operation is zero.
- Condition: Cleared to 0 otherwise.
- Example: After comparing two equal values, or after decrementing a value to zero. 

## Comparison Instructions

ARM assembly uses several instructions for comparing values and setting
condition flags in the Current Program Status Register (CPSR), which are then
used by conditional branch instructions. These comparison instructions do not
store a result in a register; their primary purpose is to update the condition
flags.

- **CMP (Compare):** This instruction subtracts the second operand from the first
and updates the condition flags (N, Z, C, V) in the CPSR based on the result. It
is functionally similar to a SUBS instruction where the result is discarded.

- **CMN (Compare Negative):** This instruction adds the second operand to the first
and updates the condition flags based on the result. It is functionally similar
to an ADDS instruction where the result is discarded. This is useful for
comparing a register with a negative value.

- **TST (Test):** This instruction performs a bitwise AND operation between two
operands and updates the N and Z flags based on the result. It is used to check
if specific bits are set in a register.

- **TEQ (Test Equivalence):** This instruction performs a bitwise XOR operation
between two operands and updates the N and Z flags based on the result. It is
used to check for equality of two values, as the Z flag will be set if the XOR
result is zero.

**MRS (Move to Register from Special Register)** and
**MSR (Move from Register to Special Register)** are used to move data between a
general-purpose register and a special-purpose register, like the Program
Status Register (PSR).  MRS copies the value from a special register to a
general-purpose register, while MSR copies a value from a general-purpose
register to a special register.  These instructions are essential for reading
and modifying processor state, such as condition flags, though their usage is
restricted by processor mode and privilege level. 

E.g:

```
MRS r0, CPSR
MRS r1, SPSR
```

```
CMP r8, #0 ; r = =0?
BEQ routine ; yes, then go to my routine
TST r4, r3 ; r * 3 = 0xC0000000 to test bits 31, 30
TEQ r9, r4, LSL #3
```

```
MRS r3, APSR ; read flag information into r3
MSR APSR, r2 ; write to just the flags
MSR PSR, r7  ; write all status information to r7
```

**What sets N, Z, C, V flags?**

1. Flag setting and clearing instructions TST or CMP
2. Explicit flag setting instructions i.e. instructions ending in S e.g. ADDS, SUBS
3. Direct write to PSR to explicitly set or clear flags
4. 16-bit Thumb ALU instruction

## Boolean Operations

ARM assembly uses specific instructions to perform bitwise logical operations
that can be used to implement boolean logic. These instructions operate on the
individual bits of registers, treating them as boolean values (0 for false, 1
for true).

- AND: Performs a bitwise logical AND operation.
- ORR: Performs a bitwise logical OR operation.
- EOR: Performs a bitwise logical Exclusive OR (XOR) operation.
- BIC: Performs a Bit Clear operation. This is equivalent to Rd = Rn AND NOT Operand2.

```
MOVN r5, #0     ; r5 = -1 in two's complement
AND r1, r2, r3  ; r1 = r2 AND r3
ORR r1, r2, r3  ; r1 = r2 OR r3
EOR r1, r2, r3  ; r1 = r2 exclusive OR r3
BIC r1, r2, r3  ; r1 = r2 AND NOT 3
```

## Shifts and Rotations

ARM assembly includes shift (LSL, LSR, ASR) and rotate (ROR, RRX) instructions
to manipulate bits within a register. Shifts move bits left or right, dropping
bits from one end and filling with zeros (logical) or the sign bit (arithmetic).
Rotations, however, move bits off one end and insert them on the opposite end,
wrapping the bits around. 

