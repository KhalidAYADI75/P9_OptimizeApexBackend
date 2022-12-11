@isTest
public class OrderTriggerHandlerTest {
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
    public static void checkTheMethodRunsAccordingToTheTriggerTest() {
        List<Account> accountList=new List<Account>();
        List<Order> orderList=new List<Order>();
        Account account = [SELECT Id, Chiffre_d_affaire__c FROM Account WHERE Name='New Account'];
        Order order = [SELECT Id,AccountId,NetAmount__c,TotalAmount,ShipmentCost__c FROM Order WHERE AccountId=:account.Id];
       	Test.StartTest();
        update order;
        Test.StopTest();
		Order orderUpdated = [SELECT Id,AccountId,NetAmount__c,TotalAmount,ShipmentCost__c FROM Order WHERE AccountId=:account.Id]; 
        Account accountUpdated = [SELECT Id,Chiffre_d_affaire__c FROM Account WHERE Id=:orderUpdated.AccountId];      
        System.AssertEquals(21400.00,orderUpdated.NetAmount__c);
        System.AssertEquals(21500.00,accountUpdated.Chiffre_d_affaire__c);

    }
}