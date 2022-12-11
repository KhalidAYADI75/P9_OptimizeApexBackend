@isTest
public class UnitOfWorkTest {
    @testSetup static void setup() {
         TestDataFactory.createAccountWithDescription('New Account', 'This is a description');
    }
    @isTest
    public static void testUpdateSobject() {
        List<Account> accountList = new List<Account>();
        Account account = [SELECT Id,Name,Description FROM Account WHERE Name = 'New Account'];
        account.Description = 'The description is modified';
        accountList.add(account);
        UnitOfWork unitOfWork = new UnitOfWork();
        unitOfWork.sObjectToUpdate.addAll(accountList);
        Test.startTest();
        unitOfWork.updateSobject();
        Test.stopTest();
        Account accountUpdated = [SELECT Id,Name,Description FROM Account WHERE Name = 'New Account'];
        System.AssertEquals('The description is modified' , accountUpdated.description);
    }
}
