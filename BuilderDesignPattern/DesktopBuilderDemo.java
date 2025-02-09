public class DesktopBuilderDemo{
    public static void main(String[] args) {
        DesktopDirector director  =  new DesktopDirector();
        DellDesktopBuilder dellDesktopBuilder = new DellDesktopBuilder();
        Desktop dellDesktop = director.buildDesktop(dellDesktopBuilder);
         
        HPDesktopBuilder hpDesktopBuilder = new HPDesktopBuilder();
        Desktop hpDesktop = director.buildDesktop(hpDesktopBuilder);

        dellDesktop.display();
        hpDesktop.display();
    }
}