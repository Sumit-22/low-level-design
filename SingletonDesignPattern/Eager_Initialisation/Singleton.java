/* 
 * 1. Eager Initialization (Early Instantiation)

    The instance is created at the time of class loading.
    Simple but wastes memory if the instance is never used.
 */

class Singleton {
    private static final Singleton instance = new Singleton(); // Instance created at class loading

    private Singleton() {} // Private constructor

    public static Singleton getInstance() {
        return instance;
    }
}
/* 
✅ Pros: Thread-safe without synchronization
❌ Cons: Unused instance leads to memory wastage

*/