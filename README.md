## JavaOauth2FullExample
This is a Java example of how to impliment Oauth2 in Constant Contact's V3 API

This repository is all the code used in my working project to impliment this example. 

To use: Replace "Your_Redirect_URL","Your_Client_ID" and "Your_Client_Secret" with the approprate variables.

### Server Flow
The *serverFlow.java* file contains three methods: 
 1. **getAuthenticationUrl()**
This method can be used to generate the URL an account owner would use to allow your app to access their account.
After visiting the URL, the account owner is prompted to log in and allow your app to access their account.
They are then redirected to your redirect URI with the authorization code appended as a query parameter.
      E.g.: `http://localhost:8888/?code={authorization_code}`
      
      - This function takes the following two parameters:
        1. *redirectUri*   URL Encoded Redirect URL
        2. *clientId*      API Key

 2. **getAccessToken()**
This method is used to exchange an authorization code to get an access and refresh token.
Make this call by passing in the code present when the account owner is redirected back to you after authenticating.
The response will contain an 'access_token' and 'refresh_token' in a JSON object.
      
      - This function takes the following two parameters:
        1. *redirectUri*   URL Encoded Redirect URL
        2. *clientId*      API Key
        3. *clientSecret*  API Secret
        4. *authCode*      Authorization Code
        
 3. **refreshToken()**
This method is used to exchange a refresh token for a new access token and refresh token. 
Make this call by passing in the refresh token returned with the access token. 
The response will contain a new 'access_token' and 'refresh_token'.
      
      - This function takes the following two parameters:
        1. *clientId*      API Key
        2. *clientSecret*  API Secret
        3. *refresh_token* Refresh Token
        
### Client Flow
The *clientFlow.java* file contains one method: 
 1. **getAuthorizationUrl()**
This method can be used to generate a URL that the account owner would use to allow the app to access their account. Once the URL is accessed, the account owner is asked to log in and allow the app to access their account. They are then redirected to your redirect URL with the access token in the URL as a URL hash fragment.
      E.g.: `http://localhost:8888/#access_token={new_access_token}&token_type=Bearer`
      
      - This function takes the following two parameters:
        1. *redirectUri*   URL Encoded Redirect URL
        2. *clientId*      API Key
