/**
 * Created by justincronkhite on 1/3/23.
 */

public with sharing class SendTrackingNumber {
     public static void trackingInfo(String trackingNumber) {
         String accToken = PennyAuth.run();
        id opp = '0068Z00001WsYwRQAV';
         track(accToken, trackingNumber, opp);
     }
         private static void track(String accessToken, String trackingNumber, id opp) {
         String endpoint = 'https://pennyroyal-dev-ed.my.salesforce.com/services/data/v55.0/sobjects/Opportunity/'+opp;
         String body = '{"TrackingNumber__c":"'+ trackingNumber +'"}';
         Httprequest request = new HttpRequest();
         Http http = new Http();
         HttpResponse response;

         request.setEndpoint(endpoint);
         request.setMethod('PATCH');
         // we can use either of the two below lines for content Type.
         request.setHeader('Content-Type','application/json;charset=UTF-8');
         //request.setHeader('Content-Type','application/x-www-form-urlencoded');
         request.setHeader('Authorization','Bearer ' + accessToken);
         request.setBody(body);
             response = http.send(request);
         System.debug('body: ' + response.getBody());
     }
}
