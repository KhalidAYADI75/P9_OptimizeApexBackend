@isTest
private class testUpdateAccountCA {
    @isTest
    public static void verifyThatSalesRevenueIsEqualToTotalAmountOfAnOrder() {
        Account account = new Account(Name = 'Test Account 1');
        insert account;
        
        Product2 product = new Product2(Name = 'Chemise Verte longue XYX', Family = 'Chemise');
        Insert product;
 
        //Create the PricebookEntry
        PricebookEntry priceBookEntry = new PricebookEntry(
            Pricebook2Id = Test.getStandardPricebookId(),
            Product2Id = product.Id,
            UnitPrice = 1020,
            IsActive = true
        );
        Insert priceBookEntry;

        Order order = new Order(AccountId = account.Id,EffectiveDate = System.today(), Status = 'Draft',Pricebook2Id = Test.getStandardPricebookId());
        insert order;

        OrderItem orderItem1 = new OrderItem (OrderId = order.Id, PricebookEntryId = priceBookEntry.Id, Quantity=10, UnitPrice = 150);
        insert orderItem1;
        OrderItem orderItem2 = new OrderItem (OrderId = order.Id, PricebookEntryId = priceBookEntry.Id, Quantity=20, UnitPrice = 1000);
        insert orderItem2; 
        
        Test.StartTest();
        update order;
        Test.StopTest();
        Account updatedAccount = [SELECT Id, Chiffre_d_affaire__c FROM Account WHERE Name='Test Account 1'];        
        System.AssertEquals(21500.00,updatedAccount.Chiffre_d_affaire__c);
    }
}
