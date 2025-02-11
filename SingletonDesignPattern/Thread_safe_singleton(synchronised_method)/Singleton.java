/*
 * Thread-Safe Singleton (Synchronized Method)

    Uses synchronized to ensure only one instance is created.
 */
class Singleton {
    private static Singleton instance;

    private Singleton() {}

    public static synchronized Singleton getInstance() { // Synchronized method
        if (instance == null) {
            instance = new Singleton();
        }
        return instance;
    }
}
/*
 * ✅ Pros: Thread-safe
❌ Cons: Synchronization reduces performance due to method-level locking
 */