global class UpdateAccounts implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext info){ 
        //Requeter seulement les comptes qui ont au moins une commande avec le Status 'Ordered'
         return Database.getQueryLocator('SELECT Id,Chiffre_d_affaire__c,(SELECT Id,Status,TotalAmount,AccountId FROM Orders WHERE Status=\'Ordered\') FROM Account WHERE Id IN (SELECT AccountId FROM Order)');
    }
     
    global void execute(Database.BatchableContext info, List<Account> scope){      
        for (Account acc : scope) {
            list<Order> listOrders = acc.Orders; 
            for (Order odr : listOrders) {
                 acc.Chiffre_d_affaire__c = acc.Chiffre_d_affaire__c + odr.TotalAmount;
            }
        }
        update scope;
    }    
     
    global void finish(Database.BatchableContext info){     
        
    }
}