@isTest
public class AccountSelectorTest {
	@testSetup static void setup() {
 		Account newAccount = TestDataFactory.createAccount('New Account'); 
    }
    @isTest
    public static void testGetAccountsByIds() {
        Set<Id> accountIds = new Set<Id>(); 
        Account account = [SELECT Id,Name FROM Account WHERE Name='New Account'];
        accountIds.add(account.Id);
        Test.StartTest();
        List<Account> getAccountList = AccountSelector.getAccountsByIds(accountIds);
        Test.StopTest();
        System.AssertEquals(1,getAccountList.size());
    }
     @isTest
    public static void testGetAccountsWithOrdersAmountHavingStatusOrdered() {
        Test.startTest();
      	String accountListQuery= AccountSelector.getAccountsWithOrdersAmountHavingStatusOrdered();
        Test.StopTest();
        System.AssertNotEquals(null, accountListQuery);
    }
    @isTest
    public static void testGetAccountsWithOrdersHavingStatusOrdered() {
        Test.startTest();
      	String accountListQuery = AccountSelector.getAccountsWithOrdersHavingStatusOrdered();
        Test.StopTest();
        System.AssertNotEquals(null, accountListQuery);
    }
}