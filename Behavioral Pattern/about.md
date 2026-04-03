## Behavioral Patterns
Behavioral design patterns focus on **how objects communicate and how responsibilities are distributed between them**.

If:

- Creational patterns answer → *How are objects created?*
- Structural patterns answer → *How are objects arranged?*
- Behavioral patterns answer → **How do objects behave and interact?**

They are about:

- Communication flow
- Responsibility delegation
- Algorithm variation
- Runtime decision making
- Event handling

## Why Do We Need Behavioral Patterns?

In real systems, objects don’t live alone. They:

- Send requests
- Trigger events
- React to state changes
- Coordinate workflows
- Choose algorithms dynamically

Without proper design:

- You get massive if-else blocks
- Tight coupling
- Hard-to-test code
- Rigid systems

Behavioral patterns help you:

- Reduce coupling
- Increase flexibility
- Make behavior extensible
- Improve maintainability

---

Types : -

[Chain of Responsibility](https://www.notion.so/Chain-of-Responsibility-31624b0bee4380328aaada0ac79ca240?pvs=21)

[Command](https://www.notion.so/Command-31624b0bee43808dafaae72026e89681?pvs=21)

[Interpreter](https://www.notion.so/Interpreter-31624b0bee4380049790d7fd02ce05e5?pvs=21)

[Iterator](https://www.notion.so/Iterator-31624b0bee43801697f7f4be2f208a2a?pvs=21)

[Mediator](https://www.notion.so/Mediator-31624b0bee4380628430ec276e261247?pvs=21)

[Memento](https://www.notion.so/Memento-31624b0bee4380e69ea0d5303e49ed7a?pvs=21)

[Observer](https://www.notion.so/Observer-31624b0bee43804aad58fe3006c43c74?pvs=21)

[State](https://www.notion.so/State-31624b0bee4380faba19c4308e7bb456?pvs=21)

[Strategy](https://www.notion.so/Strategy-31624b0bee43803386f8f7257040ad44?pvs=21)

[Template Method](https://www.notion.so/Template-Method-31624b0bee438008b879ed8deb7b9957?pvs=21)

[Visitor](https://www.notion.so/Visitor-31624b0bee43808ea125cc5f930b56a9?pvs=21)

## Simple Real-World Analogy

Think about a food delivery app:

- Order state changes (State pattern)
- Payment method selection (Strategy pattern)
- Notification to user and restaurant (Observer pattern)
- Fraud check chain (Chain of Responsibility)
- Undo order action (Command pattern)

All of this is behavior management.

## When Should You Think About Behavioral Patterns?

You should think about them when:

- Logic depends on state
- You have multiple interchangeable algorithms
- Objects are too tightly coupled
- You need event-driven architecture
- You need undo/redo or command execution
- You want dynamic behavior changes at runtime

---

## When NOT to Use Them

Don’t use behavioral patterns if:

- The system is small and simple
- One or two if-else conditions are enough
- You’re overengineering just for “pattern usage”
- The complexity of pattern > actual problem

Patterns are tools, not goals.