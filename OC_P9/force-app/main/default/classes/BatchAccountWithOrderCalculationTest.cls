@isTest
private class BatchAccountWithOrderCalculationTest {
    @testSetup static void setup() {
        Account account = TestDataFactory.createAccount('Test Account 1');
        Product2 product = TestDataFactory.createProduct('Chemise Verte longue XYX', 'Chemise');
 		PriceBookEntry priceBookEntry = TestDataFactory.createPriceBookEntry(product);
		Order order = TestDataFactory.createOrder(account.Id);        
        TestDataFactory.createOrderItem(order, priceBookEntry, 10, 150.00);
		TestDataFactory.createOrderItem(order, priceBookEntry, 20, 1000.00);
    }
    @isTest
    public static void testVerifyThatSalesRevenueIsEqualToTotalAmountOfOrders() {
        Order order = [SELECT Id,AccountId FROM Order WHERE Pricebook2Id =:Test.getStandardPricebookId()];
       	Test.StartTest();
        Database.executeBatch(new BatchAccountWithOrderCalculation () );
        Test.StopTest();
        Account updatedAccount = [SELECT Id, Chiffre_d_affaire__c FROM Account WHERE Id=:order.AccountId]; 
        System.AssertEquals(21500.00,updatedAccount.Chiffre_d_affaire__c);
    }
}
