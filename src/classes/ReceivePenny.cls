/**
 * Created by justincronkhite on 1/21/23.
 */
@RestResource (UrlMapping='/Asset/*')
global with sharing class ReceivePenny {
    @HttpPost
    global static void orderInventory(String status, String address,
        String customer, String extOppName, Date purchDate,String caseSafeOppId, List<String> productCodes) {


        List <Asset> inventory = new List <Asset>();
        for (String codes: productCodes){
             Asset order = [SELECT Id, ProductCode FROM Asset WHERE Status = 'In Stock' AND ProductCode = :codes LIMIT 1];
             Asset toUpdate = new Asset();
             toUpdate.Id = order.Id;
             toUpdate.Shipping_Address__c = address;
             toUpdate.Customer_Name__c = customer;
             toUpdate.External_Opp_Name__c = extOppName;
             toUpdate.PurchaseDate = purchDate;
             toUpdate.Ext_Opportunity_Id__c = caseSafeOppId;
             toUpdate.Status = 'Purchased';
             inventory.add(toUpdate);
         } update inventory;



    }
}