/*
 *  Double-Checked Locking (Thread-Safe & Optimized)

    Uses volatile and double-checking to improve performance.
 */
class Singleton {
    private static volatile Singleton instance; // Volatile ensures visibility across threads

    private Singleton() {}

    public static Singleton getInstance() {
        if (instance == null) { // First check
            synchronized (Singleton.class) {
                if (instance == null) { // Second check
                    instance = new Singleton();
                }
            }
        }
        return instance;
    }
}
/*
 * ✅ Pros: Thread-safe, better performance than synchronized methods
❌ Cons: Slightly complex implementation
 */