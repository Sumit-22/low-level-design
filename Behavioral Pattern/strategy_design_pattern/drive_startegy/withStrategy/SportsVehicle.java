package strategy_design_pattern.drive_strategy.withStrategy;
public class SportsVehicle extends vehicle{
    SportsVehicle(){
        super(new SportsDriveStrategy());
    }
}