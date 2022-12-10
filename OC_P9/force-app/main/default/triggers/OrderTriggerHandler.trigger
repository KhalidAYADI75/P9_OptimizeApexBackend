//Trigger that fires on order update
//before update --> calculate order net amount minus shipment costs
//after update  --> update account sales revenue with total of all orders amounts
trigger OrderTriggerHandler on Order (before update, after update) {
   UnitOfWork unitOfWork = new UnitOfWork();
    if (trigger.isBefore) {
        OrderAmountCalculation.netAmountCalculation(trigger.new);
    } else if (trigger.isAfter) {
        List<Account> accountsToUpdate = AccountSalesRevenueCalculation.salesRevenueCalculation(trigger.new);
        unitOfWork.sObjectToUpdate.addAll(accountsToUpdate);
    }
    unitOfWork.updateSobject();
}