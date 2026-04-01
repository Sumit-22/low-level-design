/*
 * Enum Singleton (Recommended)

    Most recommended approach as enums handle serialization and reflection attacks.
 */
enum Singleton {
    INSTANCE;

    public void show() {
        System.out.println("Singleton using Enum!");
    }
}
/*
 * ✅ Pros: Thread-safe, protects against serialization and reflection
❌ Cons: Less flexible, cannot inherit another class
 */