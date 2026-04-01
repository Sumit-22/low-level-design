package strategy_design_pattern.drive_strategy.withStrategy;
public class GoodsVehicle extends vehicle{
    GoodsVehicle(){
        super(new NormalDriveStrategy());
    }   
}