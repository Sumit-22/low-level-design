/*
ex- implement notify me features for e commerce websites
Real-World ex 2: YouTube Notification System:-
Imagine a YouTube channel (Observable) that has Subscribers (Observers).

📢 Scenario:

    User 1, User 2, and User 3 subscribe to the "TechNews" YouTube channel.
    The TechNews channel uploads a new video (state change).
    All subscribed users get notified automatically!
    So, basically this system we have to designed here
*/

+----------------------+                     +----------------------+                                          
|   <<interface>>      |    has-a            |   <<interface>>      |
|   Observable         |    ------>          |   Observer          |
+----------------------+     (0,*)           +----------------------+
| + add(obj: Observer) |                     | + update()          |
| + remove(obj: Observer) |                  +----------------------+
| + notify()           |                                 △ 
| + setData(data: int) |                                 |  
+----------------------+                                 |  is-a                    
        △                                                |                                                                         
        │                                    +---------------------------+                               
        │ is-a                               | ConcreteObserver          |                                                                       
        │                                    +---------------------------+                                                                                                                                                                               
+---------------------------+                | + update()                |                                      
| ConcreteObservable        |                +---------------------------+                                                                                          
+---------------------------+                                                                                                   
| - data: int               |                                                                                                       
| - objList: List<Observer> |                                                                                                       
+---------------------------+                                                                                       
| + add(obj: Observer)      |                                                                                                                   
| + remove(obj: Observer)   |                                                                                                                   
| + notify()                |                                                                                                                   
| + setData(data: int)      |                                                                                                                   
+---------------------------+     


basic method implementation:-
In observable class :-
private List<Observer> observerList = new ArrayList<>();
  public void add(Observer observer) { //register an observer
        observerList.add(observer);
    }

    // Unregister an observer
    public void remove(Observer observer) {
        observerList.remove(observer);
    }

    // Notify all observers about a change
    public void notifyObservers() {
        for (Observer observer : observerList) {
            observer.update(this); // Passing 'this' (Observable instance) so Observer can pull data (case 1 we un
        }
    }
    /* now for notify  we have two approaches 
    1> Passing a Parameter in update() Method
