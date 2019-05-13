<!--
Brianna Norwood
April 30, 2019

Example page that retrieves and refreshes access/refresh tokesn on press of the button
-->

<%@ page import="example.clientFlow" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Java Oauth2 Example</title>
    <link href="example_style_sheet.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        if(window.location.hash) {
            var access_token = window.location.hash.substr(14, 28);
        } else {
            var access_token = "None Set";
        }
    </script>
</head>

<body>
<br />
<table class="table1">
    <tr>
        <td width="100%" align="center">
            <br />

            <h2>Please click on the button to get a new access token.</h2>

            <%
                clientFlow client = new clientFlow();

                String AuthUrlClient =
                        client.getAuthorizationUrl("http://localhost:7070/client",
                                "bc5bc574-9499-456a-81e2-3fc10ab4a6bb");

                request.getSession().setAttribute("AuthUrlClient", AuthUrlClient);

            %>

                <a href="<%=AuthUrlClient%>"><button type="submit" name="button">Reconnect Your Account!</button></a>
            <br /><br />

            <table class="table2" width="30%" border="0" cellpadding="20px" cellspacing="0" align="center">
                <tr>
                    <td class="td1" align="center">
                        <div><strong>Access Token: </strong><br />
                            <script type="text/javascript">
                                document.write(access_token)
                            </script>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>