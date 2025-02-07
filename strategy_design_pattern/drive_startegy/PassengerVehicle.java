public class PassengerVehicle extends vehicle{
    PassengerVehicle(){
        super(new NormalDriveStrategy());
    }
    public void drive(){
        System.out.println("normal drive capability");
    }
}