@isTest
public class OrderAmountCalculationTest {
    @testSetup static void setup() {
 		TestDataFactory.createAccount('New Account');
        Account newAccount = [SELECT Id FROM Account WHERE Name='New Account'];
       	Product2 product = TestDataFactory.createProduct('Chemise Verte longue XYX', 'Chemise');
 		PriceBookEntry priceBookEntry = TestDataFactory.createPriceBookEntry(product);
		Order order = TestDataFactory.createOrderWithShipmentCost(newAccount.Id , 100.00);        
        TestDataFactory.createOrderItem(order, priceBookEntry, 10, 150.00);
		TestDataFactory.createOrderItem(order, priceBookEntry, 20, 1000.00);   
    }
    @isTest
    public static void testNetAmountCalculation() {
        List<Order> orderList = [SELECT Id,AccountId,TotalAmount,NetAmount__c,ShipmentCost__c FROM Order WHERE Pricebook2Id =:Test.getStandardPricebookId()];
     	Test.startTest();
        OrderAmountCalculation.netAmountCalculation(orderList);
        Test.stopTest();
        System.AssertEquals(21400.00,orderList.get(0).NetAmount__c);
    }
}