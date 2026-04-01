/*
 * Lazy Initialization

    The instance is created only when required.
    Not thread-safe by default.
 */
class Singleton {
    private static Singleton instance;

    private Singleton() {}

    public static Singleton getInstance() {
        if (instance == null) {
            instance = new Singleton(); // Created only when needed
        }
        return instance;
    }
}
/*
 * ✅ Pros: Saves memory if the instance isn’t used
❌ Cons: Not thread-safe—multiple threads may create multiple instances

 */