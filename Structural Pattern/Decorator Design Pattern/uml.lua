        +---------------------+
        | <<Interface>>       |
        |   Component         | ◁------------------+
        |---------------------|      implements     |
        | + operation(): void |                     |
        +---------------------+                     |
                 △                                 |
                 | implements                       |
                 |                                  |
     +---------------------+                   +------------------------+ 
     | ConcreteComponent   |                   | AbstractDecorator      | 
     |---------------------|                   |------------------------|  
     | + operation(): void |                   | - component: Component |
     +---------------------+                   | + operation(): void    |
                                               +------------------------+                              
                                                    △
                                                    |
                                                    |
                                       +--------------------------+
                                       | ConcreteDecoratorA       |
                                       |--------------------------|
                                       | + operation(): void      |
                                       | + addedBehaviorA()       |
                                       +--------------------------+


                   
        +---------------------+
        | <<Interface>>       |
        |  basePizza          | ◁------------------+------------------------+
        |---------------------|      implements     | PizzaDecorator         | //abstract class
        | +createPizza():void |                     |------------------------|  
        +---------------------+                     | - Pizza :basePizza     |
                 △                                 |------------------------|
                 | implements                       | + PizzaDecorator()     | 
                 |-----------------                 | +createPizza():void    |  ◁---------
     +---------------------+       |                +------------------------+            |
     | CheesePizza         |       |                              △                      |
     |---------------------|       |                              |                       |
     |+createPizza():void  |       |                              |                       |
     +---------------------+       |implements         +---------------------+    +---------------------+           
                                   |                   |        Mushroom     |    |        Onion        |
                                   |                   |---------------------|    |---------------------|
                                   |                   | - Pizza :basePizza  |    | - Pizza :basePizza  |
                          +---------------------+      |---------------------|    |---------------------|  
                          | LoadedPizza         |      | + PizzaDecorator()  |    | + PizzaDecorator()  |
                          |---------------------|      | +createPizza():void |    | +createPizza():void |
                          |+createPizza():void  |      +---------------------+    +---------------------+
                          +---------------------+
