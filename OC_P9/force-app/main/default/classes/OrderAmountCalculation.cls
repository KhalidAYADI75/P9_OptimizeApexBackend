//Class that calculates the Net Amount of orders by subtracting shipment costs
//replace the trigger CalculMontant.trigger
public class OrderAmountCalculation {
    public static void netAmountCalculation(List<Order> orderList) {
        for (Order newOrder : orderList) {
            newOrder.NetAmount__c = newOrder.TotalAmount - newOrder.ShipmentCost__c;
        }
    }
}