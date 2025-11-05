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