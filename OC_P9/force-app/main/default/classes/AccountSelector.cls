//class that manage the SOQL queries on Accounts
public class AccountSelector {

    public static List<Account> getAccountsByIds(Set<Id> orderAccountIds) {
        List<Account> accountList = [SELECT Id, Chiffre_d_affaire__c FROM Account WHERE Id IN : orderAccountIds];
        return accountList;
    }
    public static String getAccountsWithOrdersAmountHavingStatusOrdered() {
        String accountListQuery = 'SELECT Id,Chiffre_d_affaire__c,(SELECT Id,Status,TotalAmount,AccountId FROM Orders WHERE Status=\'Ordered\') FROM Account WHERE Id IN (SELECT AccountId FROM Order WHERE Status=\'Ordered\')';
        return accountListQuery;
    }
    public static String getAccountsWithOrdersHavingStatusOrdered() {
        String accountListQuery = 'SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Order WHERE Status=\'Ordered\')';
        return accountListQuery;
    }
}
