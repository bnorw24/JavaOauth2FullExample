package example;

public class clientFlow {

    /*
     * This method can be used to exchange an authorization code for an access token.
     * Make this call by passing in the code present when the account owner is redirected back to you after authenticating.
     * The response will contain an 'access_token' and 'refresh_token' in a JSON object.
     */

    /**
     * @param redirectUri   URL Encoded Redirect URI
     * @param clientId      API Key
     * @return              Full Authorization URL
     */
    public String getAuthorizationUrl(String redirectUri, String clientId){

        String baseUrl = "https://api.cc.email/v3/idfed";
        String authUrl = baseUrl + "?client_id=" + clientId + "&scope=contact_data&response_type=token"
                + "&redirect_uri=" + redirectUri;

        return authUrl;
    }
}
