## Synchronous Discount Orchestration Service
# 🔷 1. UML CLASS DIAGRAM (CORE DESIGN)

```mermaid
classDiagram

class ApplyDiscountRequest {
    -idCustomer : long
    -idProduct : long
    -idDiscount : long
}

class DiscountFacade {
    -CustomerService
    -ProductService
    -DiscountService
    +applyDiscount(req)
}

class CustomerService {
    +findProductBy(id)
}

class ProductService {
    +findProductBy(id)
}

class DiscountService {
    +applyDiscount(customer, product)
}

class Customer {
    -name
    -address
    -birthDate
}

class Product {
    -idProduct
    -name
    -price
}

DiscountFacade --> CustomerService
DiscountFacade --> ProductService
DiscountFacade --> DiscountService

CustomerService --> Customer
ProductService --> Product
DiscountService --> Customer
DiscountService --> Product

DiscountFacade --> ApplyDiscountRequest
```

---

## 🧠 Samajh

👉 **Facade = DiscountFacade (main entry point)**
👉 Baaki sab = subsystems

---

# 🔷 2. OBJECT RELATION FLOW (ARROWS 🔥)

```mermaid
graph TD

Client --> DiscountFacade

DiscountFacade --> CustomerService
DiscountFacade --> ProductService
DiscountFacade --> DiscountService

CustomerService --> Customer
ProductService --> Product

DiscountService --> Customer
DiscountService --> Product
```

---

## 🧠 Meaning

* Client sirf **Facade ko call karta hai**
* Facade internally sab services call karta hai

---

# 🔷 3. DATA FLOW (VERY IMPORTANT 🔥)

```mermaid
graph LR

Request[ApplyDiscountRequest]
    --> DiscountFacade

DiscountFacade -->|idCustomer| CustomerService
DiscountFacade -->|idProduct| ProductService

CustomerService --> Customer
ProductService --> Product

Customer --> DiscountService
Product --> DiscountService

DiscountService --> Result[Discount Applied]
```

---

## 🧠 Insight

👉 Data flow:

* Request → IDs
* IDs → Services
* Services → Objects
* Objects → DiscountService

---

# 🔷 4. EXECUTION FLOW (SEQUENCE DIAGRAM 🔥)

```mermaid
sequenceDiagram

participant Client
participant Facade
participant CustomerService
participant ProductService
participant DiscountService

Client->>Facade: applyDiscount(request)

Facade->>CustomerService: findCustomer(id)
CustomerService-->>Facade: Customer

Facade->>ProductService: findProduct(id)
ProductService-->>Facade: Product

Facade->>DiscountService: applyDiscount(customer, product)

DiscountService-->>Facade: success

Facade-->>Client: true
```

---

## 🧠 EXACT FLOW

```text
1. Client calls Facade
2. Facade gets Customer
3. Facade gets Product
4. Facade applies discount
5. Return result
```

---

# 🔷 5. CONTROL FLOW (SIMPLIFIED)

```mermaid
graph TD

Start --> Facade

Facade --> CustomerService
Facade --> ProductService

CustomerService --> Customer
ProductService --> Product

Customer --> DiscountService
Product --> DiscountService

DiscountService --> End
```

---

# 🔷 6. MEMORY VIEW (IMPORTANT)

```mermaid
graph TD

Facade --> CustomerService
Facade --> ProductService
Facade --> DiscountService

CustomerService --> CustomerObj
ProductService --> ProductObj
DiscountService --> Operation
```

---

## 🧠 Insight

👉 No sharing (unlike Flyweight)

👉 Each request creates:

* Customer object
* Product object

---

# 🔷 7. FULL SYSTEM FLOW (REAL SYSTEM STYLE)

```mermaid
graph TD

Client --> API

API --> DiscountFacade

DiscountFacade --> CustomerService
DiscountFacade --> ProductService
DiscountFacade --> DiscountService

CustomerService --> DB[(Customer DB)]
ProductService --> DB[(Product DB)]

DiscountService --> Response

Response --> Client
```

---

# 🔥 INTERVIEW DRAWING (SUPER IMPORTANT)

👉 Agar board pe draw karna ho:

```
Client
  ↓
DiscountFacade
  ↓
 ├── CustomerService → Customer
 ├── ProductService → Product
 └── DiscountService → Apply Discount
```

---

# 🔥 GOLD UNDERSTANDING

👉 Facade ka role:

```
Hide complexity
Provide single entry point
Orchestrate services
```

---

# ⚡ COMMON INTERVIEW QUESTION

## ❓ “Is this Orchestrator?”

👉 ✅ YES

👉 Facade here = **Orchestrator (code level)**

---

# 🔥 FINAL INTERVIEW LINE

> “I used Facade pattern to orchestrate multiple services like customer, product, and discount behind a single interface. This simplifies client interaction and reduces coupling.”

---

# 🚀 NEXT LEVEL

Agar tu aur next level jaana chahta hai:

* 🔥 Isko convert karte hain → **Microservices + Kafka Saga**
* 🔥 Add karte hain → **Retry + Circuit Breaker + Redis**
* 🔥 Bana dete hain → **Swiggy/Uber real system**

Bol: **“convert to microservices”** 🚀
