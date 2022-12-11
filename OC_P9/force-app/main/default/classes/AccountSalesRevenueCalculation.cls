//Class that calculates the total sales revenue of an account by addition of all the orders amounts
//replace trigger UpdateAccountCA.trigger
public class AccountSalesRevenueCalculation {
    public static List<Account> salesRevenueCalculation(list<Order> orderList) {
        Set<Id> orderAccountIds = new Set<Id>(); 
        for(integer i=0; i< orderList.size(); i++){
        orderAccountIds.add(orderList[i].AccountId); 
        }
        Map<Id,Account> accountMap = new Map<Id,Account> (AccountSelector.getAccountsByIds(orderAccountIds));     
            for (Order odr : orderList) {
                if (accountMap.containsKey(odr.AccountId)) {
                    Account accountOrder = accountMap.get(odr.AccountId);
                    accountOrder.Chiffre_d_affaire__c = accountOrder.Chiffre_d_affaire__c + odr.TotalAmount;
                }
            }
        return accountMap.values();
    }
}