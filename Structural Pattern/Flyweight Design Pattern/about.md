## 🔥 Why It Exists

To reduce memory usage when many objects share data.

Example:

Game with 10 million trees.

Tree type (texture, color) same.

Position differs.
Store common data once.

---

## When To Use

- Massive object creation
- Shared intrinsic state
- Memory optimization needed

## When NOT To Use

- Small scale app
- Memory not a concern