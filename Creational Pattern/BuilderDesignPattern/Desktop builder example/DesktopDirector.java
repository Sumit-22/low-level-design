class DesktopDirector{
    public Desktop buildDesktop(DesktopBuilder builder){
        builder.buildMotherboard();
        builder.buildProcessor();
        builder.buildstorage();
        builder.buildMemory();
        builder.buildGraphicsCard();
        return builder.getDesktop();
    }
}