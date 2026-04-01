
ProductPrototype:--

-------------------------------------------------
|               ProductPrototype                |
-------------------------------------------------
| {abstract} ~ProductPrototype                  |
-------------------------------------------------
| + clone(): ProductPrototype                   |
| + display(): void                              |
-------------------------------------------------

            ▲
            | implements
            |
-------------------------------------------------
|               Product                          |
-------------------------------------------------
| - name: string                                 |
| - price: double                               |
-------------------------------------------------
| + Product()                                   |
| + clone(): ProductPrototype*                  |
| + display(): void                             |
-------------------------------------------------

RouterDemo:-

-------------------------------------------------
|              <<NetworkDevice>>                |
-------------------------------------------------                      
| + clone(): NetworkDevice*                     |                      
| + display(): void                             |                                           
| + clone(): NetworkDevice*                     |                      
| + display(): void                             |
| + update(string): void                        |
-------------------------------------------------
                                        ▲
            ▲                           |
            | implements                | implements             -------------------------------------------------
            |                           |________________        |                 Router                         |
            |                                                     -------------------------------------------------
  -------------------------------------------------              | - name: string                                 |
  |                 Switch                          |            | - ip: string                                   |
  -------------------------------------------------              | - securityPolicy: string                       |
  | - name: string                                  |          
  | - protocol: string                              |             -------------------------------------------------
   -------------------------------------------------             | + Router(string, string, string)               |
   | + Switch(string, string)                        |           | + clone(): NetworkDevice*                      |
   | + clone(): NetworkDevice*                       |           | + display(): void                              |
   | + display(): void                               |            | + update(string): void                        |
   | + update(string): void                          |           -------------------------------------------------
   -------------------------------------------------
                          
