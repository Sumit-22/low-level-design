package strategy_design_pattern.drive_strategy.withStrategy;
public class offRoadVehicle extends vehicle{
    offRoadVehicle(){
        super(new SportsDriveStrategy());
    }
    public void drive(){
        System.out.println("sports drive capability");
    }
}