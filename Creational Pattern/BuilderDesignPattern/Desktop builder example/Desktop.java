class Desktop{
    private String Motherboard;
    private String processor;
    private String memory;
    private String storage;
    private String graphicsCard;

    public void display(){
        System.out.println("Desktop Specs:");
        System.out.println("Motherboard: "+ Motherboard);
        System.out.println("Processor: "+processor);
        System.out.println("Memory: "+memory);
        System.out.println("Storage: "+storage);
        System.out.println("Graphics Card: "+graphicsCard);
    }

    public String getMotherboard(){
        return Motherboard;
    }

    public void setMotherboard(String Motherboard){
        this.Motherboard = Motherboard;
    }

    
    public String getprocessor(){
        return processor;
    }

    public void setprocessor(String processor){
        this.processor = processor;
    }

    
    public String getmemory(){
        return memory;
    }

    public void setmemory(String memory){
        this.memory = memory;
    }

    
    public String getstorage(){
        return storage;
    }

    public void setstorage(String storage){
        this.storage = storage;
    }

    
    public String getgraphicsCard(){
        return graphicsCard;
    }

    public void setgraphicsCard(String graphicsCard){
        this.graphicsCard = graphicsCard;
    }
}