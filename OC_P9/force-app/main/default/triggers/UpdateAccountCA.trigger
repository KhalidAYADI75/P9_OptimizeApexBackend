trigger UpdateAccountCA on Order (after update) {    
	set<Id> orderAccountIds = new set<Id>(); 
    for(integer i=0; i< trigger.new.size(); i++){
       orderAccountIds.add(trigger.new[i].AccountId); 
    }
    List<Account> accList = [SELECT Id, Chiffre_d_affaire__c FROM Account WHERE Id IN : orderAccountIds];    
    for (Account acc : accList) {       
        for (Order odr : trigger.New) {
        	if (odr.AccountId == acc.Id) {
                acc.Chiffre_d_affaire__c = acc.Chiffre_d_affaire__c + odr.TotalAmount;
            }
        }
    }
    update accList;
}