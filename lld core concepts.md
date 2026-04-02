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

# 🔷 1. What is Caching (Core Intuition)

Caching = **store expensive-to-fetch data in fast memory (RAM)** so next request is fast.

### Example:

* DB query → 100ms
* Cache (Redis / in-memory) → 1ms

👉 So system becomes:

```
Client → Cache → DB (only on miss)
```

---

# 🔷 2. Cache Flow (VERY IMPORTANT)

```
Request → Check Cache
           ↓
      HIT → return data
      MISS → fetch from DB → store in cache → return
```

---

# 🔷 3. SDE-1: LRU Cache (Most Important)

## ✅ Intuition

Remove the **least recently used** item.

👉 Why?
Recent items are likely to be reused (temporal locality)

---

## 🔹 Example

```
Capacity = 3
Cache = [A, B, C]

Access A → [B, C, A]
Insert D → remove B → [C, A, D]
```

---

## 🔹 Data Structures Used

👉 This is **interview gold**

| Structure          | Purpose        |
| ------------------ | -------------- |
| HashMap            | O(1) lookup    |
| Doubly Linked List | Maintain order |

---

## 🔹 Why Doubly Linked List?

Because:

* Remove node in O(1)
* Move node to front in O(1)

---

## 🔹 Java Implementation (Clean)

```java
class LRUCache {

    class Node {
        int key, value;
        Node prev, next;
    }

    private Map<Integer, Node> map = new HashMap<>();
    private int capacity;
    private Node head, tail;

    public LRUCache(int capacity) {
        this.capacity = capacity;
        head = new Node();
        tail = new Node();
        head.next = tail;
        tail.prev = head;
    }

    public int get(int key) {
        if (!map.containsKey(key)) return -1;

        Node node = map.get(key);
        remove(node);
        insert(node);
        return node.value;
    }

    public void put(int key, int value) {
        if (map.containsKey(key)) {
            remove(map.get(key));
        }

        if (map.size() == capacity) {
            Node lru = tail.prev;
            remove(lru);
            map.remove(lru.key);
        }

        Node node = new Node();
        node.key = key;
        node.value = value;
        insert(node);
        map.put(key, node);
    }

    private void insert(Node node) {
        node.next = head.next;
        node.prev = head;
        head.next.prev = node;
        head.next = node;
    }

    private void remove(Node node) {
        node.prev.next = node.next;
        node.next.prev = node.prev;
    }
}
```

---

## 🔹 Complexity

| Operation | Time |
| --------- | ---- |
| get       | O(1) |
| put       | O(1) |

---

# 🔷 4. SDE-1: LFU Cache

## ✅ Intuition

Remove **least frequently used** item.

---

## 🔹 Example

```
Cache = [A(3), B(1), C(2)]
Evict → B (lowest freq)
```

---

## 🔹 Problem with LFU

* Harder to implement
* Need to track:

  * Frequency
  * Recency within same frequency

---

## 🔹 Data Structures

| Structure             | Purpose            |
| --------------------- | ------------------ |
| HashMap (key → node)  | Fast lookup        |
| HashMap (freq → list) | Group by frequency |
| Min frequency tracker | Know what to evict |

---

## 🔹 Complexity

* O(1) (but tricky implementation)

---

# 🔷 5. LRU vs LFU (INTERVIEW FAV)

| Feature  | LRU                 | LFU              |
| -------- | ------------------- | ---------------- |
| Basis    | Recency             | Frequency        |
| Easy?    | ✅ Yes               | ❌ Hard           |
| Use case | Recent data matters | Hot data matters |
| Example  | Browsers            | CDN              |

---

# 🔷 6. Cache Invalidation (HARDEST PROBLEM)

👉 “When to remove or update cache?”

---

## 🔹 Types

### 1. Time-based (TTL)

Auto expire after time

```
Cache: user_profile
TTL = 5 min
```

---

### 2. Event-based

When DB updates → invalidate cache

```
User updates profile → delete cache
```

---

### 3. Manual Invalidation

Admin clears cache

---

## 🔴 Problem:

* Stale data (old data served)

---

# 🔷 7. TTL (Time-To-Live)

Each cache entry has expiry time.

```
Key: user_123
Value: profile
TTL: 300 seconds
```

👉 After expiry → treated as MISS

---

# 🔷 8. Write Strategies (VERY IMPORTANT)

---

## ✅ 1. Write-Through

```
Write → Cache + DB (both)
```

✔ Pros:

* Consistent data

❌ Cons:

* Slow writes

---

## ✅ 2. Write-Back (Write-Behind)

```
Write → Cache
DB updated later
```

✔ Pros:

* Fast

❌ Cons:

* Data loss risk

---

## ✅ 3. Write-Around

```
Write → DB only
Cache updated on next read
```

✔ Pros:

* Avoid useless caching

❌ Cons:

* First read is slow

---

# 🔷 9. Distributed Cache

## 🔹 Why needed?

Single cache won’t scale.

---

## 🔹 Popular Systems

* Redis
* Memcached

---

## 🔹 Architecture

```
App Servers → Cache Cluster → DB
```

---

# 🔷 10. Consistent Hashing (CRITICAL)

## Problem:

When adding/removing servers → data reshuffle

---

## Solution:

Consistent hashing minimizes movement

```
Key → Hash ring → nearest server
```

✔ Only small % of keys move

---

# 🔷 11. Cache Partitioning

## Types:

### 1. Horizontal (Sharding)

Split data across nodes

```
UserID % N → server
```

---

### 2. Replication

Same data on multiple nodes

✔ Improves availability

---

# 🔷 12. Real Problems (VERY IMPORTANT)

---

## ⚠️ 1. Cache Stampede

Many requests hit DB when cache expires.

### Example:

```
Hot key expires → 1M requests → DB crash
```

---

### Solutions:

* Mutex lock
* Request coalescing
* Early refresh

---

## ⚠️ 2. Stale Data

Cache has outdated data.

### Solutions:

* TTL
* Event invalidation
* Versioning

---

## ⚠️ 3. Memory Limits

Cache is limited RAM.

### Solutions:

* Eviction policies (LRU/LFU)
* Compression
* Tiered caching

---

# 🔷 13. Advanced Concepts

---

## 🔥 Cache Aside (Most Common Pattern)

```
Read:
→ check cache
→ miss → DB → cache

Write:
→ DB → invalidate cache
```

---

## 🔥 Read-Through Cache

Cache itself fetches from DB

---

## 🔥 Write-Through Cache

Cache handles DB writes

---

## 🔥 Hot Keys Problem

Few keys get huge traffic.

### Solution:

* Replication
* Load balancing

---

# 🔷 14. Real System Example (Swiggy/Uber Style)

---

## 🔹 What is Cached?

* Restaurant list
* Driver locations
* Pricing
* User session

---

## 🔹 Flow

```
User opens app
→ Fetch restaurants
→ Cache hit (fast)

New restaurant added
→ Invalidate cache
```

---

## 🔹 Tech Stack

* Redis (primary cache)
* CDN (images)
* DB (source of truth)

---

# 🔷 15. Interview Summary (CRISP)

If interviewer asks:

👉 “Design a cache system”

You say:

* Use LRU for eviction
* Redis for distributed cache
* Cache-aside pattern
* Add TTL for expiry
* Use consistent hashing for scaling
* Handle stampede with locking

---

# 🔥 Final Takeaway

Caching is not just:
❌ “store data in memory”

It is about:
✔ Consistency
✔ Scalability
✔ Trade-offs
✔ Failure handling

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
