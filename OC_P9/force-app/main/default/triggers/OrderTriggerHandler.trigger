trigger OrderTriggerHandler on Order (before update, after update) {
    if (trigger.isBefore) {
        new OrderAmountCalculation.netAmountCalculation(trigger.new);
    } else if (trigger.isAfter) {
        new AccountSalesCalculation.salesCalculation(trigger.new);
    }
}