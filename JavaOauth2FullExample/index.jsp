<!--
Brianna Norwood
April 30, 2019

Home page that links to client and server oauth2 examples
-->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="example.clientFlow" %>
<%@ page import="example.serverFlow" %>

<html>
<head>
    <title>Java Oauth2 Example</title>
    <link href="example_style_sheet.css" rel="stylesheet" type="text/css">
</head>

<body>
<br/>
<table class="table1">
    <tr>
        <td align="center">
            <br/>
            <h2>Please click below to see a server flow example of Oauth2!</h2>
            <%

  serverFlow server = new serverFlow();
  String authUrlServer = server.getAuthenticationUrl("Your_Redirect_URL","Your_Client_ID");


  clientFlow client = new clientFlow();
String authUrlClient = client.getAuthorizationUrl("Your_Redirect_URL",
        "Your_Client_ID");

%>
            <table class="table3" width="40%" border="0" cellpadding="20px" cellspacing="0" align="center">
                <tr>
                    <td align="center" class="td1">
                        <a href="<%=authUrlServer%>" target="_blank"><button>Click to see the Server Flow!</button></a>
                    </td>
                    <td align="center" class="td1">
                        <a href="<%=authUrlClient%>" target="_blank"><button>Click to see the Client Flow!</button></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br>
<br>
</body>
</html>
