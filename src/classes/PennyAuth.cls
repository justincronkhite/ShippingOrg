/**
 * Created by justincronkhite on 1/3/23.
 */

public with sharing class PennyAuth {
    public static String run() {
        String endpoint = 'https://login.salesforce.com/services/oauth2/token';
        String username = 'maynard@pennyroyal.com';
        String password = 'nOrCCU29Tf2uEiz7NecI8XH5jCOfPttkMT079';
        String CONSUMER_KEY = '3MVG9tSqyyAXNH5JL3AdnWmkhr.HiJrdX7TLCxt2zQxnR00lbQGGl_IKGzRhO9xh_rqEp8QmuWIw3QgNyI3Vo';
        String CONSUMER_SECRET = 'D2A656BDF7B155C92D599240D4D1ACB67FE313A7E4301FC834F510ACD70BDA04';

        HttpRequest pen = new HttpRequest();
        pen.setMethod('POST');
        pen.setHeader('Content-Type','application/x-www-form-urlencoded');

        pen.setBody(
                'grant_type=password' +
                        '&client_id=' + CONSUMER_KEY +
                        '&client_secret=' + CONSUMER_SECRET +
                        '&username=' + username +
                        '&password=' + password);
        pen.setEndpoint(endpoint);

        Http http = new Http();
        HttpResponse response;
        String accessToken;

        try {
            response = http.send(pen);
            system.debug('body: ' + response.getBody());
            accessToken = parseResponseForAccessToken(response.getBody());
        }catch(System.CalloutException error){
            System.debug('error: ' + error);
        }
        System.debug('access token: ' + accessToken);
        System.debug(UserInfo.getOrganizationId().substring(0, 15) + ' ' +  UserInfo.getSessionId().substring(15));
    return accessToken;
    }
    private static String parseResponseForAccessToken(String responseBody) {
        String accessToken;

        JSONParser parser = JSON.createParser(responseBody);
    while (parser.nextToken() != null) {
    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'access_token')) {
    parser.nextToken();
accessToken = parser.getText();
            }
        }
return accessToken;
    }
}
