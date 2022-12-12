@isTest
public class AccountSalesRevenueCalculationTest {
    @testSetup static void setup() {
        Account newAccount = TestDataFactory.createAccount('New Account');
       	Product2 product = TestDataFactory.createProduct('Chemise Verte longue XYX', 'Chemise');
 		PriceBookEntry priceBookEntry = TestDataFactory.createPriceBookEntry(product);
		Order order = TestDataFactory.createOrder(newAccount.Id);        
        TestDataFactory.createOrderItem(order, priceBookEntry, 10, 150.00);
		TestDataFactory.createOrderItem(order, priceBookEntry, 20, 1000.00);       
    }
    @isTest
    public static void testVerifyThatSalesRevenueIsEqualToTotalAmountOfOneOrder() {
        Account newAccount = TestDataFactory.createAccount('New Account');
        Product2 product = TestDataFactory.createProduct('Chemise Verte longue XYX', 'Chemise');
         PriceBookEntry priceBookEntry = TestDataFactory.createPriceBookEntry(product);
        Order order = TestDataFactory.createOrder(newAccount.Id);        
        TestDataFactory.createOrderItem(order, priceBookEntry, 10, 150.00);
        TestDataFactory.createOrderItem(order, priceBookEntry, 20, 1000.00);       
        List<Order> orderList = [SELECT Id,AccountId,TotalAmount FROM Order WHERE Pricebook2Id =:Test.getStandardPricebookId()];
     	Test.startTest();
        List<Account> accountList = AccountSalesRevenueCalculation.salesRevenueCalculation(orderList);
        Test.stopTest();
        System.AssertEquals(21500.00,accountList.get(0).Chiffre_d_affaire__c);
    }	 
    public static void testVerifyThatSalesRevenueIsEqualToTotalAmountOfMultipleOrders() {
        Account newAccount = TestDataFactory.createAccount('New Account');
        Product2 product = TestDataFactory.createProduct('Chemise Verte longue XYX', 'Chemise');
         PriceBookEntry priceBookEntry = TestDataFactory.createPriceBookEntry(product);        
        List<Order> ordersList = TestDataFactory.createMultipleOrders(newAccount.id,200);        
        TestDataFactory.createOrderItemForMultipleOrders(ordersList, priceBookEntrys, 10, 150.00); 
           
        List<Order> orderList = [SELECT Id,AccountId,TotalAmount FROM Order WHERE Pricebook2Id =:Test.getStandardPricebookId()];
     	Test.startTest();
        List<Account> accountList = AccountSalesRevenueCalculation.salesRevenueCalculation(orderList);
        Test.stopTest();
        System.AssertEquals(300000.00,accountList.get(0).Chiffre_d_affaire__c);
    } 

}