# Builder Design Pattern

The Core Problem Builder Solves : -

Builder pattern exists because **constructors become messy, confusing, and unsafe when objects have many parameters or optional fields.**

That’s it at the core.

Ex : - The Telescoping Constructor Problem (without builder)

```java
class User {
    String name;
    int age;
    String email;
    String phone;
    String address;
    boolean isVerified;
}
// start writing constructors like
User(String name, int age)
User(String name, int age, String email)
User(String name, int age, String email, String phone)
User(String name, int age, String email, String phone, String address)
//This becomes: Hard to maintain, Hard to read, Hard to extend, Very error prone
//Builder pattern eliminates this completely.
```

# 🔹 3️⃣ Too Many Optional Fields

In real systems:

- Config objects
- API request objects
- Query objects
- DTOs
- Database configuration
- Scheduler configuration

Often have:

- 2 required fields
- 10 optional fields

Constructor approach becomes impossible to manage.

Builder allows:

- Flexible construction
- Only required fields enforced
- Optional fields added when needed

# 🔷 When Should You Use Builder?

Use Builder when:

- Object has many parameters (4+ especially)
- Many optional fields
- You want immutability
- You want readable code
- You want safe construction
- You need validation during creation

---

# 🔷 When NOT to Use Builder

Don’t use Builder if:

- Object has only 1–2 fields
- Object is simple
- No optional fields
- No complexity in creation

Overengineering is bad design.

Ex : - 

[Desktop Builder : -](https://www.notion.so/Desktop-Builder-31524b0bee438025b1b1f26cd88fe1aa?pvs=21)

[Distributed Job Scheduler Configuration : -](https://www.notion.so/Distributed-Job-Scheduler-Configuration-31524b0bee438085ad82c1854cdd03ad?pvs=21)