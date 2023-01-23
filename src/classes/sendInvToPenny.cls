public class sendInvToPenny {
    public void sendInv(Integer inv, String prodCode){
        
    }
    @future(callout=true)
    public static void sendDataToPenny(Integer inv, String prodCode ){
        //product2 prod = [Select id, Inventory_Count__c, ProductCode FROM Product2 
                        //WHERE id = :id2];
        partnerSoapSforceCom.Soap myPartnerSoap = new partnerSoapSforceCom.Soap();
        
        partnerSoapSforceCom.LoginResult partnerLoginResult = myPartnerSoap.login('maynard@pennyroyal.com', 'Yif1X7!#qokYYCyk6DUD21zXIdyEK5oJqVGZ');
        system.debug('Generated Session Id'+ partnerLoginResult.sessionId);
        String sessionIdFetch = partnerLoginResult.sessionId;
        soapSforceComSchemasClassReceivepar.SessionHeader_element webserviceSessionHeader = new soapSforceComSchemasClassReceivepar.SessionHeader_element(); 
        webserviceSessionHeader.sessionId = sessionIdFetch;
        soapSforceComSchemasClassReceivepar.receiveParametersShip objA = new soapSforceComSchemasClassReceivepar.receiveParametersShip();
        objA.SessionHeader = webserviceSessionHeader;
        string status = objA.updateInventory(inv, prodCode); 
        system.debug('status'+status);
    }
}