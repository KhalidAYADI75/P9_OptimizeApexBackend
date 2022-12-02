@isTest
public class TestDataFactory {
    public static Account createAccount(String accountName) {
        Account account = new Account(Name = accountName);
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
        Order order = new Order(AccountId = accountId,EffectiveDate = System.today(), Status = 'Draft',Pricebook2Id = Test.getStandardPricebookId());
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
}