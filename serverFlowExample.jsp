<!--
Brianna Norwood
April 30, 2019

Example page that retrieves and refreshes access/refresh tokesn on press of the button
-->

<%@ page import="example.serverFlow" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.*" %>

<html>
<head>
    <title>Java Oauth2 Example</title>
    <link href="example_style_sheet.css" rel="stylesheet" type="text/css">
</head>

<body>
<br />
<table class="table1">
    <tr>
        <td width="100%" align="center">
            <br />

<h2>Please click on the button to get new access and refresh tokens.</h2>

<% if(request.getMethod().equals("GET")){

    // Sets authCode to use in Servlet
    String authCode = "";
    try {
        authCode = request.getParameter("code");
        request.getSession().setAttribute("authCode", authCode);

        // Verifies it in console
        System.out.println("Here is the auth code from JSP: " + authCode);
    }catch(Exception a){
        System.out.println("Could not get Auth Code: " + a);
    }
    serverFlow server = new serverFlow();

    StringBuffer accessResponse =
            server.getAccessToken("http://localhost:7070/server","d72adb84-1b91-41d3-a30b-3d05afdf9b37",
                    "uMBgiL6CrddBcDM5Q2bz6Q",authCode);

//    StringBuffer accessResponse =
//            server.getAccessToken("http://voc.roving.com/bntest/CTCTv3Oauth2JavaExample/web/oauth2Example.jsp",
//                    "bc5bc574-9499-456a-81e2-3fc10ab4a6bb","BmsFs_fHXTYJPFzNvP_WLw",authCode);

    // Parse info from authResult
    String access_token = "";
    String refresh_token = "";

    try {

        JSONObject jsonObj = new JSONObject(accessResponse.toString());

        access_token = jsonObj.getString("access_token");
        refresh_token = jsonObj.getString("refresh_token");


    } catch (JSONException b) {
        System.out.println("Could not parse JSON information for access token: " + b);
    }

    request.getSession().setAttribute("accessToken", access_token);
    request.getSession().setAttribute("refreshToken", refresh_token);

}%>

<form method="POST">
<button type="submit" name="button">Get Access/Refresh Tokens!</button>
</form>

<% if(request.getMethod().equals("POST")) {


    String refreshToken = (String) request.getSession().getAttribute("refreshToken");

    if(!refreshToken.equals(null)) {
        System.out.println("Here is your refresh token: " + refreshToken);

        serverFlow server = new serverFlow();

        StringBuffer refreshResponse =
                server.refreshToken("d72adb84-1b91-41d3-a30b-3d05afdf9b37",
                        "uMBgiL6CrddBcDM5Q2bz6Q",refreshToken);
//
//        StringBuffer refreshResponse =
//                server.refreshToken("bc5bc574-9499-456a-81e2-3fc10ab4a6bb", "BmsFs_fHXTYJPFzNvP_WLw", refreshToken);

        // Parse info from authResult
        String access_token = "";
        String refresh_token = "";

        try {

            JSONObject jsonObj = new JSONObject(refreshResponse.toString());

            access_token = jsonObj.getString("access_token");
            refresh_token = jsonObj.getString("refresh_token");


        } catch (JSONException b) {
            System.out.println("Could not parse JSON information for access token: " + b);
        }

        request.getSession().setAttribute("accessToken", access_token);
        request.getSession().setAttribute("refreshToken", refresh_token);
    } else {
        System.out.println("Your refresh token is null.");
    }


}%>

    <table class="table2" width="40%" border="0" cellpadding="20px" cellspacing="0" align="center">
        <tr>
            <td align="center" class="td1">
                <div><strong>Access Token:</strong> <br /><%=request.getSession().getAttribute("accessToken")%></div>
            </td>
            <td align="center" class="td1">
                <div><strong>Refresh Token: </strong><br /><%=request.getSession().getAttribute("refreshToken")%></div>
            </td>
        </tr>
    </table>
        </td>
    </tr>
</table>

</body>
</html>
