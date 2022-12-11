//class that calculates the total Amount of all the orders
public without sharing class MyTeamOrdersController {
    public decimal SumOrders{
        get{
			AggregateResult groupedResults = OrderSelector.getTotalAmountOfAllOrders();
			return (decimal)groupedResults.get('total');
        }
        set;
    }
}