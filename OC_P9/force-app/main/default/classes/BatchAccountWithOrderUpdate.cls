//Batch that calculates the total sales revenue of an account by addition of all the orders amounts
global class BatchAccountWithOrderUpdate implements Database.Batchable<sObject>{
    
   global Database.QueryLocator start(Database.BatchableContext info){ 
       return Database.getQueryLocator(AccountSelector.getAccountsWithOrdersHavingStatusOrdered());
   }
    
   global void execute(Database.BatchableContext info, List<Account> scope){
       Set<Id> setAccountIds = (new Map<Id,SObject>(scope)).keySet();
       AP01Account.updateChiffreAffaire(setAccountIds);
   }    
    
   global void finish(Database.BatchableContext info){     
       
   } 
}