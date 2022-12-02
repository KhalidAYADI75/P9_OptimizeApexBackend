trigger OrderTriggerHandler on Order (before update, after update) {
    UnitOfWork unitOfWork = new UnitOfWork();
    if (trigger.isBefore) {
        OrderAmountCalculation.netAmountCalculation(trigger.new);
    } else if (trigger.isAfter) {
        Set<Account> accountsToUpdate = AccountSalesCalculation.salesRevenueCalculation(trigger.new);
        unitOfWork.sObjectToUpdate.addAll(accountsToUpdate);
    }
    unitOfWork.updateSobject();
}