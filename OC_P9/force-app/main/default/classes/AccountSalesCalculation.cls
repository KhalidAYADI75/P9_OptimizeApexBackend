//replace trigger UpdateAccountCA.trigger
public class AccountSalesCalculation {
    public void salesCalculation(list<Order> OrderList) {
        set<Id> orderAccountIds = new set<Id>(); 
        for(integer i=0; i< OrderList.size(); i++){
        orderAccountIds.add(OrderList[i].AccountId); 
        }
        
        Map<Id,Account> accMap = new Map<Id,Account> ([SELECT Id, Chiffre_d_affaire__c FROM Account WHERE Id IN : orderAccountIds]);     
            for (Order odr : OrderList) {
                if (accMap.containsKey(odr.AccountId)) {
                    Account accountOrder = accMap.get(odr.AccountId);
                    accountOrder.Chiffre_d_affaire__c = accountOrder.Chiffre_d_affaire__c + odr.TotalAmount;
                }
            }
        
        update accMap.values();
    }
}