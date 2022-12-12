@isTest
public class TestDataFactory {
    public static Account createAccount(String accountName) {
        Account account = new Account(Name = accountName);
        insert account;
        return account;
    }
    public static Account createAccountWithDescription(String accountName, String description) {
        Account account = new Account(Name = accountName, Description = description);
        insert account;
        return account;
    }
    public static Product2 createProduct(String accountName, String familyName) {
        Product2 product = new Product2(Name = 'Chemise Verte longue XYX', Family = 'Chemise');
        Insert product;
        return product;
    }
    public static PricebookEntry createPriceBookEntry(Product2 product) {
    	PricebookEntry priceBookEntry = new PricebookEntry(
            Pricebook2Id = Test.getStandardPricebookId(),
            Product2Id = product.Id,
            UnitPrice = 1020,
            IsActive = true
        );
        Insert priceBookEntry;
        return priceBookEntry;
    }   
    public static Order createOrder(ID accountId) {
        Order order = new Order(AccountId = accountId,EffectiveDate = System.today(), Status = 'Ordered',Pricebook2Id = Test.getStandardPricebookId());
        insert order;
        return order;
    }
    public static List<Order> createMultipleOrders(ID accountId,Integer numberOfOrders) {
        List<Order> orderList = new List<Order>();
        for (Integer i=0;i<numberOfOrders;i++ ) {
            Order newOrder = new Order(AccountId = accountId,EffectiveDate = System.today(), Status = 'Ordered',Pricebook2Id = Test.getStandardPricebookId());
            orderList.add(newOrder);
        }
        insert orderList;
        return orderList;
   }
     public static Order createOrderWithShipmentCost(ID accountId, Decimal ShipmentCost) {
        Order order = new Order(
            AccountId = accountId,
            ShipmentCost__c = ShipmentCost,
            EffectiveDate = System.today(), 
            Status = 'Ordered',
            Pricebook2Id = Test.getStandardPricebookId()
            );
        insert order;
        return order;
    }
    public static OrderItem createOrderItem(Order order , PriceBookEntry priceBookEntry, Integer TotalNumber, decimal Price) {
    	OrderItem orderItem = new OrderItem (
            OrderId = order.Id, 
            PricebookEntryId = priceBookEntry.Id, 
            Quantity=TotalNumber, 
            UnitPrice = Price
        );
        insert orderItem;
        return orderItem;
    }
    public static List<OrderItem> createOrderItemForMultipleOrders(List<Order> orderList , PriceBookEntry priceBookEntry, Integer TotalNumber, decimal Price) {
        List<OrderItem> orderItemList = new List<OrderItem>();
        for (Order order : orderList) {
            OrderItem orderItem = new OrderItem (
            OrderId = order.Id, 
            PricebookEntryId = priceBookEntry.Id, 
            Quantity=TotalNumber, 
            UnitPrice = Price);
            orderItemList.add(orderItem);
        }
        insert orderItemList;
        return orderItemList; 
    }
}