//replace the trigger CalculMontant.trigger
public class OrderAmountCalculation {
    public static void netAmountCalculation(List<Order> OrderList) {
        for (Order newOrder : orderList) {
            newOrder.NetAmount__c = newOrder.TotalAmount - newOrder.ShipmentCost__c;
        }
    }
}