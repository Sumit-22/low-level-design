## 🔥 Why It Exists

Subsystem is too complex.

You create a simplified interface.

Example:

Distributed Scheduler might have:

- JobValidator
- JobQueue
- RetryManager
- MetricsCollector
- Logger

Instead of client calling all individually:

```
scheduler.submit(job);
```

Facade hides complexity.

---

## When To Use

- Complex subsystem
- Library exposure
- Clean API layer
- Microservice boundary

## When NOT To Use

- System is already simple