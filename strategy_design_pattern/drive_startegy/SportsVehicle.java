public class SportsVehicle extends vehicle{
    SportsVehicle(){
        super(new SportsDriveStrategy());
    }
}