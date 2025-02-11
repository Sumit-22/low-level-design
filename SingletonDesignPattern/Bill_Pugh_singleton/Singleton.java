/*Bill Pugh Singleton (Best Approach)
 * Uses static inner class for lazy loading and thread safety.
 */
class Singleton {
    private Singleton() {}

    private static class SingletonHelper { // Inner static class
        private static final Singleton INSTANCE = new Singleton();
    }

    public static Singleton getInstance() {
        return SingletonHelper.INSTANCE;
    }
}
/*
 * ✅ Pros: Best combination of lazy loading and thread safety
❌ Cons: Not as well-known as other methods
 */