### What it is

Capture and restore object state.

### Why it exists

Undo functionality without breaking encapsulation.

### When to use

- Undo/Redo
- Checkpoint systems
- Snapshot systems

### When NOT to use

- Huge state object
- Memory expensive systems

### Example

Text editor:

Save state → Undo → Restore

Real example:

Database transaction snapshot.