//Batch that calculates the total sales revenue of an account by addition of all the orders amounts
//replace class UpdateAccountCA.cls
global class BatchAccountWithOrderCalculation implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext info){ 
        //Requeter seulement les comptes qui ont au moins une commande avec le Status 'Ordered'
         return Database.getQueryLocator(AccountSelector.getAccountsWithOrdersAmountHavingStatusOrdered());
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