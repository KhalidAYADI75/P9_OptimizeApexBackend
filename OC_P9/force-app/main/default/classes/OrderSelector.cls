//class that manage the SOQL queries on Orders
public class OrderSelector {
    public static AggregateResult getTotalAmountOfAllOrders() {
        AggregateResult results = [SELECT SUM(TotalAmount) total FROM Order WHERE Status='Ordered'];
        return results;
    }
}



