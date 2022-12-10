@isTest
public class MyTeamOrdersControllerTest {
	@testSetup static void setup() {
        Account newAccount = TestDataFactory.createAccount('New Account');
       	Product2 product = TestDataFactory.createProduct('Chemise Verte longue XYX', 'Chemise');
 		PriceBookEntry priceBookEntry = TestDataFactory.createPriceBookEntry(product);
		Order order = TestDataFactory.createOrder(newAccount.Id);        
        TestDataFactory.createOrderItem(order, priceBookEntry, 10, 150.00);
		TestDataFactory.createOrderItem(order, priceBookEntry, 20, 1000.00);       
    }
    @isTest
    public static void testSumOrders () {
        Account account = [SELECT Id FROM Account WHERE Name='New Account'];
        Order order = [SELECT Id,TotalAmount FROM Order WHERE AccountId=:account.Id];
        Test.StartTest();
        MyTeamOrdersController myTeamOrdersController = new MyTeamOrdersController();
        Test.StopTest();
        System.AssertEquals(21500.00,myTeamOrdersController.SumOrders);
    }
}