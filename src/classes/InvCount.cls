public class InvCount {
    public static void count(Id recordId){
        //Get inventory count on current record Id
        Integer inventory = [SELECT count() FROM Asset where Product2Id = :recordId AND Status = 'In Stock'];
        System.debug(inventory);
        List <Product2> current = [SELECT Id, name, Inventory_Count__c, ProductCode FROM Product2 WHERE Id = :recordId];
        //update current record id inventory field
         
        current[0].Inventory_Count__c = inventory;
		Update current;
        String prodCode = current[0].ProductCode;
          
        sendInvToPenny.sendDataToPenny(inventory, ProdCode);
    }
}