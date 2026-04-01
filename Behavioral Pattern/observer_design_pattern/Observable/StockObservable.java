package observer_design_pattern.Observable;

import observer_design_pattern.Observer.NotificationAlertObserver;

public interface StockObservable {

    public void add(NotificationAlertObserver observer);
    public void remove(NotificationAlertObserver observer);
    public  void notifySubscribers();
    public void setStockCount(int newStockAdded);
    public int getStockCount();
}