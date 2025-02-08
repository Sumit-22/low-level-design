/*
sometimes we get code duplicacy during inheriting from parentclass to child class
         ■      (parent class)  
         |       
    /        \      
   ■          ■  (child class)
   |          |    
/     \     /   \   
■      ■  ■       ■ 
may be some of these child classes have same code :-code redundant problem,so, as features are increasing , it may cause increase in no. of child classes having same types of that feature -> cause  increase in code redundancy
suppose these are assumed as tree so, may be at same level some child have different( like special tyres in vehicle parent class) features are same or some have other different feature (fuel ) , it can also possible


When to Use:-




When NOT to Use the Strategy Pattern:-

❌ If you have a fixed algorithm that never changes.
❌ If you have only one way to perform an operation.
❌ If adding multiple strategies makes the system unnecessarily complex.


drawbacks:--
❌ Can lead to too many classes if there are too many strategies.
❌ Overhead of selecting the correct strategy at runtime.

*/
/*
drive_strategy
*/

                          +----------------------+
                          |   <<interface>>       |
                          |    DriveStrategy      |
                          +----------------------+
                          | + drive(): void       |
                          +----------------------+
                                   ▲
                                   │
    --------------------------------------------------------------
    |                              |                             |
+----------------------+       +-------------------+          +-------------------+
| NormalDriveStrategy |       | SportsDriveStrategy |          | XYZDriveStrategy |
+----------------------+       +-------------------+          +-------------------+
| + drive(): void     |       | + drive(): void    |          | + drive(): void |
+----------------------+       +-------------------+          +-------------------+

                                     +-----------------------------+
                                     |       Vehicle               |
                                     +-----------------------------+
                                     | - driveStrategy:            |
                                     |   DriveStrategy             |
                                     +-----------------------------+
                                     | + Vehicle(ds: DriveStrategy)|
                                     | + drive(): void             |
                                     +-----------------------------+    
                                                    ▲
         ---------------------------------------------------------------------------------------------
         |                            |                              |                               |
+------------------+         +--------------------+         +----------------------+         +------------------+
| GoodsVehicle     |         | OffRoadVehicle     |         | PassengerVehicle     |         | SportsVehicle    |
+------------------+         +--------------------+         +----------------------+         +-------------------+
| + GoodsVehicle() |         | + OffRoadVehicle() |         | + PassengerVehicle() |         | + SportsVehicle() |
| {NormalDrive}    |         | {SportsDrive}      |         | {NormalDrive}        |         | {SportsDrive}     |
| + drive(): void  |         | + drive(): void    |         | + drive(): void      |         | + drive(): void   |
+------------------+         +--------------------+         +-----------------------+         +------------------+


/*
payment_service :--
*/
+------------------+        +---------------------+
|   Context       |         |    Strategy        |
| --------------- |         |  + execute()       |
| - strategy: S   |<>------>|                    |
| + setStrategy() |         |                    |
| + execute()     |         |                    |
+------------------+        +---------------------+
                                ▲      ▲      ▲
                                |      |      |
                 +-----------------+  +----------------+
                 |CreditCardPayment|  | PayPalPayment  |
                 |-----------------|  |--------------- |
                 | + execute()     |  | + execute()    |
                 +-----------------+  +----------------+
