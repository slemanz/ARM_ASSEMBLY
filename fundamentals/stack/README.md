# Stack

In ARM assembly, the stack is a crucial region of memory used for temporary data
storage, primarily for function calls and local variables. It operates as a
Last-In-First-Out (LIFO) data structure, meaning the last item added is the
first one removed.

## LDM and STM

LDM (Load Multiple) and STM (Store Multiple) are ARM assembly instructions for
transferring a block of registers to or from memory in a single operation. LDM
loads registers from memory, while STM stores registers to memory. These
instructions are more efficient than individual LDR or STR instructions,
especially for transferring multiple words of data, and are commonly used for
implementing stack operations like push and pop

`LDM <address-mode> {<cond>} <Rn> {!}, <reg-list>`

Example of use:

`LDMIA r9, {r0-r3}`

is equal:

```
LDR r0, [r9]
LDR r0, [r9, #4]
LDR r0, [r9, #8]
LDR r0, [r9, #12]
```

(STM is the exactly same syntax)

- IA : Increment After
- IB : Increment Before
- DA : Decrement After
- DB : Decrement Before

## Syntax of the PUSH and POP instruction