### What it is

Object changes behavior when internal state changes.

### Why it exists

Remove large if-else based on state.

### When to use

- Finite state machines
- Workflow engines
- Order lifecycle

### When NOT to use

- Only 2 states
- Very simple logic

### Example

Order:

```
Created -> Paid -> Shipped -> Delivered
```

Each state class defines behavior.