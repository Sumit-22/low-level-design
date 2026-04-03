# 🔁 Iterator Design Pattern – Introduction

---

# 🧠 What is Iterator Pattern?

The **Iterator Design Pattern** is a **behavioral design pattern** that provides a way to:

👉 **Access elements of a collection sequentially without exposing its internal structure**

---

# 🎯 Intent (GOF Definition)

> Provide a way to access the elements of an aggregate object sequentially without exposing its underlying representation.

---

# ⚡ Real-Life Analogy

👉 Think of a **TV remote**

* You don’t care how channels are stored
* You just press **next / previous**

Same idea:

* You don’t know array/list internals
* You just use `next()`

---

# 🧩 Core Components

---

## 1️⃣ Iterator (Interface)

Defines traversal methods:

* `hasNext()`
* `next()`
* `remove()`

---

## 2️⃣ Concrete Iterator

* Implements iterator logic
* Keeps track of current position

---

## 3️⃣ Aggregate (Iterable)

* Collection that provides iterator

---

## 4️⃣ Concrete Aggregate

* Actual data structure (e.g., `ProductRepository`)

---

# 🔄 How It Works

1. Client requests iterator
2. Iterator maintains position
3. Client uses `hasNext()` and `next()`
4. Collection remains hidden

---

# ❌ Problem Without Iterator

* Direct array/list exposure
* Tight coupling
* Hard to change structure
* Unsafe access
---

# ✅ Benefits of Iterator

* Encapsulation
* Clean traversal
* Multiple iteration strategies possible
* Works with `for-each` loop

---

# 🧠 When to Use?

* Need to traverse collection
* Don’t want to expose internals
* Multiple traversal strategies required

---

# 🔥 Iterator vs For Loop

| Feature         | Iterator | For Loop |
| --------------- | -------- | -------- |
| Encapsulation   | ✅ Yes    | ❌ No     |
| Flexibility     | High     | Low      |
| Standardization | Yes      | No       |

---

# 💡 Java Example

👉 Java internally uses iterator in:

```java
for (String item : list)
```

👉 This actually calls:

```java
Iterator<String> it = list.iterator();
```

---

# 🚀 One-Line Summary

👉
“Iterator pattern allows sequential traversal of a collection without exposing its internal structure.”

---
