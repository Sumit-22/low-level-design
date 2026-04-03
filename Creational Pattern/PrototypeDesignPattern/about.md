## 🔷 What is Prototype Pattern?

Prototype pattern allows you to **create new objects by copying an existing object**, instead of creating them from scratch.

Instead of:

```java
new Router("R1", "192.168.1.1", "HIGH_SECURITY");
```

You do:

```java

Router r2 = (Router) r1.clone();
```

# 🔷 Why Prototype Exists

Because sometimes:

- Object creation is expensive
- Object initialization is complex
- Object has many configuration steps
- You want to avoid re-building from scratch
- You don’t know exact concrete type at runtime

Prototype solves this by:

> “Copy an existing fully configured object.”
> 

# 🔷 Real Problem It Solves

Imagine:

- Router configuration takes 50 steps
- Security policies loaded from file
- Certificates generated
- Connections initialized

Creating 100 routers from scratch would be heavy.

Instead:

1. Create one base router
2. Clone it
3. Change only IP address

Much faster.

# 🔷 Core Idea

Instead of:

> Create new instance via constructor
> 

We say:

> Duplicate an existing instance.
> 

That’s the mindset shift.

---

# 🔷 When To Use Prototype

Use Prototype when:

### ✅ 1. Object creation is expensive

- DB connections
- Network device configs
- Large configuration objects

### ✅ 2. Many similar objects needed

- Same config, small variations
- Game objects
- Microservice configs

### ✅ 3. You don’t want client to depend on concrete class

Client only knows:

```
NetworkDevicedevice=prototype.clone();
```

Not whether it is Router or Switch.

### ✅ 4. Dynamic object types at runtime

When actual type is decided dynamically.

---

# 🔷 Real Industry Examples

Prototype is used in:

- Object caching systems
- Game engines (cloning enemies)
- Configuration templates
- Document templates
- VM/container templates
- Kubernetes pod templates
- Thread pool task templates

---

# 🔷 Deep Technical Insight: Shallow vs Deep Copy

This is very important.

When cloning:

### 🔹 Shallow Copy

- Copies references
- Faster
- Risky if object has mutable fields

### 🔹 Deep Copy

- Copies full object graph
- Safe
- Slightly slower

In real systems, deep copy is usually needed.

Interviewers love asking this.

---

# 🔷 When NOT To Use Prototype

Do NOT use when:

- Object creation is cheap
- Object is simple
- No duplication needed
- Object contains complex circular references
- Deep cloning is very complicated

Overengineering again.

[Generic Example](https://www.notion.so/Generic-Example-31524b0bee43809aa38cf4145a997108?pvs=21)

[Technical Example](https://www.notion.so/Technical-Example-31524b0bee43802bb100c2204203f363?pvs=21)

# 🔷 Compare With Builder

| Builder | Prototype |
| --- | --- |
| Build step by step | Copy existing object |
| Used for complex construction | Used for duplication |
| Focus on creation logic | Focus on cloning logic |
| Good for immutability | Risky with mutable objects |