Weather Station ------>> TV Display Observer
observable  |___________-->Mobile Display Observer
(for current temp.)

                +-----------------+
                |   <<Interface>>  |
                |    Subject       |  
                +-----------------+
                | + add(Observer)  |
                | + remove(Observer) |
                | + notifyObservers() |
                +-----------------+
                        △
                        |  implements (is-a)
                        |

+----------------------+                     +----------------------+                                          
|   WeatherStation     |    has-a            |   <<interface>>      |
|   (Concrete Class)   |    ------>          |   Observer           |  
+----------------------+   (0,*)             +----------------------+ 
| - temperature: int   |                     | + update(temp: int)  |  <-- Push Model
| - observerList: List<Observer> |           | + update(obs: Subject) |  <-- Pull Model
+----------------------+                     +----------------------+
| + add(obj: Observer) |                                 △ 
| + remove(obj: Observer) |                             |  
| + notifyObservers()  |   <-- Calls update() on all   |  is-a                    
| + setTemperature(int) |    observers                 |                                     
| + getTemperature(): int |   <-- Needed for Pull Model|  
+----------------------+                   +---------------------------+                               
                                           | <<Concrete Observer>>      |    // TV Display Observer        
                                           | TVDisplayObserver         |    
                                           +---------------------------+                                                                  
                                           | + update(temp: int)       |   // Push Model                 
                                           | + update(obs: Subject)    |   // Pull Model   
                                           +---------------------------+                                                                                          
                                           |  // Similarly, define MobileDisplayObserver   
                                           |  // using the same structure as TVDisplayObserver   

                                           
