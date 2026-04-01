
# 🌉 Bridge Design Pattern

## 📌 Overview

The **Bridge Design Pattern** is a structural design pattern that **decouples abstraction from its implementation**, allowing both to evolve independently.

Instead of tightly coupling classes, Bridge splits them into two separate hierarchies:

* **Abstraction**
* **Implementation**

---

## 🔥 Why It Exists

When **abstraction and implementation both vary independently**, using inheritance leads to **class explosion**.

### ❌ Problem: Combinatorial Explosion

Example: `Shape + Color`

* RedCircle
* BlueCircle
* RedSquare
* BlueSquare

As dimensions increase, classes grow exponentially.

---

### 💡 Real-World Example: Notification System

#### Notification Types:

* Email
* SMS
* Push

#### Message Priorities:

* Normal
* High
* Critical

### ❌ Without Bridge (Inheritance Approach)

* HighPriorityEmail
* CriticalEmail
* HighPrioritySMS
* CriticalSMS
* HighPriorityPush
* CriticalPush

👉 This keeps growing → **hard to maintain**

---

## ✅ Solution: Bridge Pattern

Split into two independent hierarchies:

* **Abstraction → Notification**
* **Implementation → Message Priority**

Now both can vary independently without creating new subclasses.

---

## 🧠 Key Idea

> **Favor composition over inheritance**

Instead of creating multiple subclasses:

* Inject implementation into abstraction
* Combine dynamically at runtime

---

## 🏗️ Structure

```
Abstraction (Notification)
    ↓
Refined Abstraction (Email, SMS, Push)

Implementation (Priority)
    ↓
Concrete Implementations (Normal, High, Critical)
```

---

## ⚙️ Code Example

👉 [Notification Manager Code](https://www.notion.so/Code-Example-of-notification-manager-31624b0bee4380c887bcea4bff6e367b?pvs=21)

---

## 🚀 When To Use

* Two independent dimensions of variation
* Want to avoid subclass explosion
* Need flexible and scalable design
* Plugin-based architecture

---

## ❌ When NOT To Use

* Only one dimension varies
* Simple inheritance is sufficient
* Over-engineering risk in small systems

---

## 🌍 Real-World Use Cases

* Storage abstraction (S3, Azure, GCS)
* Logging frameworks (file, DB, remote)
* Device drivers
* Payment providers
* UI frameworks

---

## 🎯 Benefits

* Reduces class explosion
* Improves flexibility
* Enhances maintainability
* Promotes clean architecture

---

## ⚠️ Drawbacks

* Adds complexity
* Requires good design upfront
