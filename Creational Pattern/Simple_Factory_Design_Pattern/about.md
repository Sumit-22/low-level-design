# **Simple Factory Pattern**

The **Simple Factory Pattern** is appropriate when you want to create objects **without exposing** their instantiation logic to clients. It is useful when multiple classes share a **common interface** or **base class** and need to be instantiated based on certain conditions.

---

## **Key Characteristics**
- Has a **central factory class** with a **static method** for object creation.
- The **client code** interacts with this factory class to obtain instances **without direct knowledge** of their concrete types.

---

## **Key Components**
- **Creator (Factory) Class**: Contains a static factory method for creating objects.
- **Concrete Products**: Classes that implement a common interface or extend a base class.

---

## **Problem Solved**
- **Centralizes** object creation logic, reducing **code duplication**.
- **Encapsulates** object creation details, making the system more **maintainable** and **flexible**.
- Provides a **single entry point** for creating objects.

---
