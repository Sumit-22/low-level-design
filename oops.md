# 1️⃣ OOP Principles

## 1. Encapsulation

### Definition

Encapsulation means hiding internal state and exposing behavior through controlled methods.

```java
class BankAccount {
private double balance;
public void deposit(double amount) {
    if (amount > 0) {
        balance += amount;
    }
}

public double getBalance() {
    return balance;
	}
}
```

Balance is private. It cannot be directly modified.

### Why It Matters

- Prevents invalid state
- Improves maintainability
- Protects invariants

### Interview Angle

Say: “Encapsulation ensures controlled access and protects business rules.”

## 2. Abstraction

### Definition

Abstraction hides implementation details and exposes only essential features.

### Example

```java
interface Payment {
	void pay(double amount);
}
```

User does not care whether payment is via UPI, Card, or Wallet.

### Why It Matters

- Reduces complexity
- Improves flexibility
- Helps in switching implementations

### Interview Angle

Abstraction enables loose coupling.

---

## 3. Inheritance

### Definition

Inheritance allows one class to acquire properties of another class.

```java
class Vehicle {
void start() {}
}

class Car extends Vehicle {
}
```

### Problem

Overusing inheritance leads to tight coupling.

### Interview Tip

Prefer composition over inheritance unless there is a true “is-a” relationship.

## 4. Polymorphism

### Definition

Polymorphism allows objects to behave differently based on implementation.

Example:

```java
class CardPayment implements Payment {}
class UpiPayment implements Payment {}
```

At runtime:

```java
Payment p = new CardPayment();
p.pay(100);
```

### Types

- Compile-time (method overloading)
- Runtime (method overriding)

### Interview Insight

Polymorphism enables extensibility.

# 2️⃣ SOLID Principles

These are extremely important in LLD interviews.

---

## S – Single Responsibility Principle (SRP)

A class should have only one reason to change.

❌ Bad:

```java
class Invoice {
	calculateTotal();
	saveToDB();
	sendEmail();
}
```

✅ Good:

- InvoiceCalculator
- InvoiceRepository
- EmailService

### Interview Tip

Each class should handle one responsibility.

---

## O – Open/Closed Principle (OCP)

Open for extension, closed for modification.

Instead of modifying existing code, extend it.

Use interfaces and polymorphism.

---

## L – Liskov Substitution Principle (LSP)

A subclass should replace its parent without breaking behavior.

If Bird has fly(), Penguin should not extend Bird.

This is LSP violation.

---

## I – Interface Segregation Principle (ISP)

Clients should not depend on methods they don’t use.

❌ Large interface with many methods.

✅ Break into smaller interfaces.

---

## D – Dependency Inversion Principle (DIP)

High-level modules should not depend on low-level modules. Both should depend on abstractions.

❌

```java
class OrderService {
Payment Servicepayment = new PaymentService();
}
```

✅

```java
class OrderService {
Payment payment;
}
```

Inject implementation.

---

# 3️⃣ Association vs Aggregation vs Composition

This is frequently asked.

---

## Association

Simple relationship.

Example:

Teacher teaches Student.

Both can exist independently.

---

## Aggregation

Weak ownership.

Example:

Department has Teachers.

If Department is deleted, Teachers still exist.

Represented as hollow diamond in UML.

---

## Composition

Strong ownership.

Example:

House has Rooms.

If House is destroyed, Rooms do not exist.

Represented as filled diamond.

### Interview Tip

Composition implies lifecycle dependency.

---

# 4️⃣ Dependency Injection (DI)

Instead of creating objects inside a class, inject them.

### Without DI

```java
class OrderService {
Payment Servicepayment = new PaymentService();
}
```

Tightly coupled.

### With DI

```java
class OrderService {
Payment payment;

OrderService(Payment payment) {
this.payment=payment;
   }
}
```

### Benefits

- Loose coupling
- Easier testing
- Flexible design

Interviewers love this concept.

---

# 5️⃣ Immutable Objects

An immutable object cannot change after creation.

Example:

```java
final class User {
private final String name;

public User(String name) {
    this.name=name;
   }

public String getName() {
    return name;
   }
}
```

No setters.

### Benefits

- Thread-safe
- Predictable behavior
- Safer design

Common examples:

- String
- LocalDate

---

# 6️⃣ Cohesion & Coupling

## Cohesion

How closely related responsibilities are inside a class.

High cohesion = Good.

Example:

UserService handles only user-related logic.

---

## Coupling

Degree of dependency between classes.

Low coupling = Good.

Tightly coupled systems are hard to change.

---

# 7️⃣ DRY Principle (Don’t Repeat Yourself)

Avoid duplicate code.

Instead of repeating logic:

- Extract common methods
- Use utility classes

Reduces bugs and maintenance cost.

---

# 8️⃣ KISS Principle (Keep It Simple, Stupid)

Don’t over-engineer.

In interviews:

- Don’t introduce 20 classes unnecessarily.
- Start simple.
- Add complexity only if required.

---

# How These Are Tested in LLD Interviews

When you design:

- Check SRP violation
- Use abstraction
- Avoid tight coupling
- Prefer composition
- Use DI
- Keep classes cohesive

If you consciously apply these, interviewer immediately sees design maturity.

---

If you want, next I can:

- Show one complete LLD problem applying all these principles
- Or give you a short “Interview Revision Sheet” summarizing everything in 1 page format