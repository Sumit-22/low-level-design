package strategy_design_pattern.drive_strategy.withStrategy;
import drive_startegy.strategy.DriveStrategy;

public class vehicle{
    DriveStrategy driveObject;
    vehicle(DriveStrategy driveObj){
        this.driveObject = driveObj;
    }
    public void drive(){
       driveObject.drive();
    }
}



