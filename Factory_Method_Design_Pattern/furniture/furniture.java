interface FurnitureItem {
    void display();
}

class drawer implements FurnitureItem{
    @Override
    public void display(){
        System.out.println("Drawer");
    }
}

class Chair implements FurnitureItem{
    @Override
    public void display(){
        System.out.println("Chair");
    }
}
class Table implements FurnitureItem{
    @Override
    public void display() {
        System.out.println("Table");
    }
}

// Abstract Creator: Furniture Factory
interface FurnitureFactory {
    FurnitureItem createFurniture();
}

class ChairFactory implements FurnitureFactory {
    @Override
    public FurnitureItem createFurniture() {
        return new Chair();
    }
}
class DrawerFactory implements FurnitureFactory{
    @Override
    public FurnitureItem createFurniture(){
        return new drawer();
    }
}

class TableFactory implements FurnitureFactory {
    @Override
    public FurnitureItem createFurniture() {
        return new Table();
    }
}

public class furniture {
    public static void main(String[] args) {
        // Create factories for different types of furniture
        FurnitureFactory drawerFactory = new DrawerFactory();
        FurnitureFactory chairFactory = new ChairFactory();
        FurnitureFactory tableFactory = new TableFactory();

        // Create furniture objects using the factory methods
        FurnitureItem drawer = drawerFactory.createFurniture();
        FurnitureItem chair = chairFactory.createFurniture();
        FurnitureItem table = tableFactory.createFurniture();

        // Display the created furniture items
        drawer.display();
        chair.display();
        table.display();
    }
}