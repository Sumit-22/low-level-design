package strategy_design_pattern.drive_strategy.withStrategy.strategy;
public class SportsDriveStrategy implements DriveStrategy{
    @Override
    public void drive(){
        System.out.println("normal drive capability");
    }
}