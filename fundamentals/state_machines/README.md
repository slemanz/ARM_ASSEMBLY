# State Machines

**Moore FSM:** Output value depends on only current state.

**Mealy FSM:** Output value depends On both current state and inputs.

**Moore FSM Sequence:**

1. Get inputs
2. Go to the next state, this depends on the inputs and the current state.
3. Perform output, this depends on current state.
4. Wait for prescribed amount of time(optional)
5. 1 again

**Mealy FSM Sequence:**

1. Wait for prescribed amount of time(optional)
2. Get inputs
3. Perform output, this depends on current state and the inputs
4. Go to the next state, this depends on the inputs and the current state.
5. 1 again


## The State Graph

- Defines high-level behavior of the system.
- States are drawn as circles
- Arrows are drawn from one state to another, and labeled with the input value
causing that state transition.

## Choosing between Moore FSM and Mealy FSM

**Moore FSM:**
- Output is necessary to be a state.

**Mealy FSM:**
- No specific output value is necessary to be a state.
- Output is required to Transition the machine from one state to the next.

## FSM Implementation

- We use a linked structure with fixed size
- There should be one-to-one mapping between the FSM state graph and the data
structure.