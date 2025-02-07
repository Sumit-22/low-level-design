public class GoodsVehicle extends vehicle{
    GoodsVehicle(){
        super(new NormalDriveStrategy());
    }   
}