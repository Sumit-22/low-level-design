package strategy_design_pattern.drive_strategy.withStrategy;
public class Main{
    public static void main(String[] args) {
        vehicle vehicle = new SportsVehicle();
        vehicle.drive();
    }
}