@isTest
public class OrderSelectorTest {
	 @testSetup static void setup() {
        Account account = TestDataFactory.createAccount('Test Account 1');
        Product2 product = TestDataFactory.createProduct('Chemise Verte longue XYX', 'Chemise');
 		PriceBookEntry priceBookEntry = TestDataFactory.createPriceBookEntry(product);
		Order order = TestDataFactory.createOrder(account.Id);        
    }
    @isTest
    public static void testGetTotalAmountOfAllOrders() {
        Test.StartTest();
        AggregateResult result = OrderSelector.getTotalAmountOfAllOrders();
        System.AssertNotEquals(null, result);
    }
}
