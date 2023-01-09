trigger Inventory on Asset (after update, after insert) {
    for (Asset a : Trigger.new){
        InvCount.count(a.Product2Id);
        system.debug(Trigger.new);
    }
	
}