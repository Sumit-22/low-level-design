# Command Design Pattern

Decoupling the sender of a request from its receiver and allowing for parameterization of requests.

## Key Components:
- **Command**: Encapsulates a request as an object, including the action to be performed and its parameters.
- **Concrete Command**: Implements the command interface, binding a specific action to a receiver.
- **Invoker**: Initiates the command execution without knowing its details.
- **Receiver**: Executes the action associated with the command.

## Advantages:
- **Decoupling**: Separates sender and receiver, reducing dependencies.
- **Flexibility**: Allows for dynamic command composition and execution.
- **Undo/Redo**: Supports undoing and redoing operations by storing command history.
- **Queueing**: Enables queuing, logging, and scheduling of commands.

## Disadvantages:
- **Complexity**: May introduce additional classes and indirection.
- **Maintenance**: Can lead to a large number of command classes for complex systems.

## Examples:
- **GUI Applications**: Implementing undo/redo functionality and managing user actions.
- **Remote Control Systems**: Handling button presses for various devices.
- **Queueing Systems**: Building job queues for tasks with different parameters.
- **Transaction Management**: Managing database transactions as commands.

## Uml:
```plaintext
+-----------------+       +------------+               +---------------+
|     Client      |       |  Invoker   |  ◇-------    |   Command     |
+-----------------+       +------------+               +---------------+
         |                                                    △
         |                                                    |
         |                                                    |
         |              <<instantiates>>            +---------------------+
         | ---------------------------------------> | ConcreteCommand     |
         |                                          +---------------------+
         |                        +---------------  | -state: int         |
         |                        |   receives      | +execute(): void    |
         |                        |                 +---------------------+
         |                        |                           |
         |                        |                           |
         |                        |                           |
         ˅                        |                           |
+-----------------+               |                   +--------------------+
|   Receiver      |<--------------+                   | execute() {        |
+-----------------+                                   | receiver.action(); |
| +action(): void |                                   | }                  |
+-----------------+                                   +--------------------+
