public class PennyRoyalInvUpdate {
    public static void invUpdate(){
	Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://login.salesforce.com/services/Soap/c/54.0');
request.setMethod('POST');
request.setHeader('Content-Type', 'text/xml');
request.setHeader('SOAPAction', '');
// Set the body as a JSON object
request.setBody('<?xml version="1.0" encoding="utf-8" ?> <env:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/"> <env:Body> <n1:login xmlns:n1="urn:enterprise.soap.sforce.com"> <n1:username>maynard@pennyroyal.com</n1:username> <n1:password>nOrCCU29Tf2uEiz7NecI8XH5jCOfPttkMT079</n1:password> </n1:login> </env:Body> </env:Envelope>');
HttpResponse response = http.send(request);
// Parse the JSON response
if(response.getStatusCode() != 201) {
    System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
} else {
    System.debug(response.getBody());
}
}
}