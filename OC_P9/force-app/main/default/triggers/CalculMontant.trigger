trigger CalculMontant on Order (before update) {
	List<Order> orderList = new List<Order>();
	for(integer i=0; i< trigger.new.size(); i++){
		orderList.add(trigger.new[i]); 
	 }
	for (Order newOrder : orderList) {
		newOrder.NetAmount__c = newOrder.TotalAmount - newOrder.ShipmentCost__c;
	}
}