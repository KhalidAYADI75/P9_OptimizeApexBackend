@isTest
public class MyTeamOrdersControllerTest {
    @isTest
    public static void testSumForOneOrder () {
        Account newAccount = TestDataFactory.createAccount('New Account');
       	Product2 product = TestDataFactory.createProduct('Chemise Verte longue XYX', 'Chemise');
 		PriceBookEntry priceBookEntry = TestDataFactory.createPriceBookEntry(product);
		Order orderAccount = TestDataFactory.createOrder(newAccount.Id);        
        TestDataFactory.createOrderItem(orderAccount, priceBookEntry, 10, 150.00);
		TestDataFactory.createOrderItem(orderAccount, priceBookEntry, 20, 1000.00);
  
        Test.StartTest();
        MyTeamOrdersController myTeamOrdersController = new MyTeamOrdersController();
        Test.StopTest();
        System.AssertEquals(21500.00,myTeamOrdersController.SumOrders);
    }
     @isTest
    public static void testSumOrdersForMultipleOrders () {
        Account accountForMultipleOrders = TestDataFactory.createAccount('New Account for multiple orders');
        Product2 products = TestDataFactory.createProduct('Chemise Verte longue XYX', 'Chemise');
 		PriceBookEntry priceBookEntrys = TestDataFactory.createPriceBookEntry(products);
        List<Order> ordersList = TestDataFactory.createMultipleOrders(accountForMultipleOrders.Id,100);        
        TestDataFactory.createOrderItemForMultipleOrders(ordersList, priceBookEntrys, 10, 150.00); 
        
        Test.StartTest();
        MyTeamOrdersController myTeamOrdersController = new MyTeamOrdersController();
        Test.StopTest();
        System.AssertEquals(150000.00,myTeamOrdersController.SumOrders);
    }
    
}