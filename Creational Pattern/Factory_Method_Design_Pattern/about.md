# **Factory Method Pattern**

The **Factory Method Pattern** is useful when you want to **delegate the responsibility** of object creation to **subclasses**.

---

## **Key Characteristics**
- Appropriate when you have a **family of related classes**, and clients should interact through a **common interface**.
- Uses an **abstract creator class** or **interface** that declares a factory method.
- **Subclasses** implement the factory method to create specific objects.

---

## **Key Components**
- **Creator (Factory) Class**: Declares the **factory method**, which returns an object of a common interface or base class.
- **Concrete Creators**: Subclasses that implement the **factory method** to create specific products.
- **Products**: Classes that implement a **common interface** or extend a **common base class**.

---

## **Problem Solved**
- **Supports extensibility** by enabling the addition of new products **without modifying existing code**.
- **Promotes loose coupling** by allowing clients to work with the **creator's interface**, abstracting concrete class details.

---