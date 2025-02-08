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


-------->>>>>>>>>>Basic method implementation:-
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
            observer.update(this); // Passing 'this' (Observable instance) so Observer can pull data (case 1 we will understand it later)
        }
    }

    // Set new data and notify observers
    public void setData(int newData) {
        this.data = newData;
        notifyObservers();
    }

    // Allow observers to retrieve the latest data.YOU CAN PASS Observable also depending upon push model(pass data) or pull model (pass observable) see down:--
    public int getData() {
        return this.data;
    }

    //for observer class for case 1:-
    interface Observer {
        void update(int data);  // Observer gets the updated data directly
    }
    
Now for notify  we have two approaches :--
case 1>
 Passing a Parameter in update() Method:-
->parameter is updated data or a reference to the Observable that triggered the update.
This allows the observer to determine if it should react to the update or not
Pros

✅ Direct notification – The observer gets only the relevant data without querying the observable.
✅ No need for an  – The observer doesn't need to store a reference to the observable.
Cons
❌ Not flexible for multiple observables – If an observer subscribes to multiple observables, it can't distinguish which one triggered the update.
❌ Scalability issue – If the data is complex, passing large objects can be inefficient.

Case 2:-Establishing a "has-a" Relationship (Observer Stores a Reference to Observable)

so, we don't take parameter in update method instead we pass observable instance in observer
It's like 
public void update() {
        int latestData = observable.getData();  // Observer queries observable
        System.out.println("Received update: " + latestData);
    }

Pros

✅ Can track multiple observables – The observer knows which observable triggered the update.
✅ More flexible – The observer can pull only the necessary data from the observable.
✅ Avoids unnecessary data passing – Only a reference is passed instead of large data.
Cons

❌ Increased coupling – The observer now depends on the observable, which might make it harder to test or modify.
❌ Observers must query data – Instead of receiving data directly, they need to call a method (getData()).

    So, update uml accordingly

Which One to Use?
Passing Data in update()  ----->>	When observers are simple and only need a specific update.
Storing Observable in Observer ------>>  	When observers need more control or track multiple observables.
**Better Solution for Multiple Observables

If an observer subscribes to multiple observables, it’s better to store a reference (has-a relationship). Otherwise, checking the instance type (instanceof) inside update() becomes cumbersome.


