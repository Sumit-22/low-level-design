## Product Catalog Deduplication using Flyweight Pattern
# 🔷 1. FLYWEIGHT UML (CORE DESIGN)

```mermaid
classDiagram

class Product {
    <<Flyweight>>
    -name : String
    +toString()
}

class ProductFactory {
    -Map<String, Product> cache
    +getProduct(name) Product
}

class Order {
    -orderId : int
    -product : Product
    +processOrder()
}

class InventorySystem {
    -ProductFactory factory
    -List<Order> orders
    +executeOrder(name, id)
    +process()
}

ProductFactory --> Product : creates/reuses
Order --> Product : uses
InventorySystem --> ProductFactory
InventorySystem --> Order
```

---

## 🧠 Samajh kya aa raha hai?

👉 **Product = Flyweight (shared object)**
👉 **ProductFactory = cache manager**
👉 **Order = extrinsic state holder**
👉 **InventorySystem = orchestrator**

---

# 🔷 2. OBJECT RELATION FLOW (ARROWS 🔥)

```mermaid
graph TD

InventorySystem --> ProductFactory
ProductFactory -->|lookup(name)| Product

InventorySystem --> Order
Order --> Product
```

---

## 🧠 Meaning

* InventorySystem calls factory
* Factory returns shared Product
* Order uses that Product

---

# 🔷 3. EXECUTION FLOW (STEP-BY-STEP)

```mermaid
sequenceDiagram

participant Client
participant InventorySystem
participant ProductFactory
participant Product
participant Order

Client->>InventorySystem: executeOrder("Laptop", 101)

InventorySystem->>ProductFactory: lookup("Laptop")

alt product exists
    ProductFactory-->>InventorySystem: return existing Product
else new product
    ProductFactory->>Product: create
    ProductFactory-->>InventorySystem: return Product
end

InventorySystem->>Order: create(orderId, product)

Client->>InventorySystem: process()

InventorySystem->>Order: processOrder()
```

---

# 🔷 4. MEMORY OPTIMIZATION VIEW (VERY IMPORTANT)

```mermaid
graph LR

subgraph Shared Objects
    P1[Product: Laptop]
    P2[Product: Phone]
end

subgraph Orders
    O1[Order1] --> P1
    O2[Order2] --> P1
    O3[Order3] --> P2
end
```

---

## 🧠 Key Insight

👉 Multiple orders → SAME product object
👉 Memory saved 🔥

---

# 🔷 5. REAL SYSTEM MAPPING (SWIGGY / UBER)

---

## 🏗️ Uber Mapping

```mermaid
graph TD

Ride1 --> VehicleType(MINI)
Ride2 --> VehicleType(MINI)
Ride3 --> VehicleType(SUV)

VehicleType --> PricingConfig
```

---

## 🧠 Meaning

* VehicleType = Flyweight
* Ride = Extrinsic

---

# 🔷 6. FULL SYSTEM FLOW (WITH CACHE)

```mermaid
graph TD

Client --> InventorySystem

InventorySystem --> ProductFactory

ProductFactory --> Cache[(Map Cache)]

Cache -->|HIT| Product
Cache -->|MISS| NewProduct

InventorySystem --> Order
Order --> Product
```

---

# 🔥 INTERVIEW DRAWING (IMPORTANT)

Agar interviewer bole “draw Flyweight”

👉 Tu yeh draw kare:

```
Client
  ↓
InventorySystem
  ↓
ProductFactory ───► Map Cache
  ↓                    ↓
Order ───────────────► Product (shared)
```

---

# 🔥 GOLD UNDERSTANDING

👉 Flyweight = **Factory + Cache + Shared Object**

---

# ⚡ MOST IMPORTANT DIFFERENCE (INTERVIEW TRAP)

| Component | Role               |
| --------- | ------------------ |
| Product   | Intrinsic (shared) |
| Order     | Extrinsic (unique) |
| Factory   | Cache manager      |

---

# 🚀 NEXT LEVEL

Agar tu aur strong banna chahta hai:

* 🔥 Flyweight + Redis (distributed version)
* 🔥 Flyweight vs Cache vs Singleton (confusion clear)
* 🔥 Game engine level Flyweight (millions objects)

Bol: **“advanced flyweight”** 🚀
