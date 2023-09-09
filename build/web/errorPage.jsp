<%-- 
    Document   : errorPage
    Created on : May 4, 2023, 4:12:59 PM
    Author     : Seha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page isErrorPage="true" %>
        <h1>Opps</h1>
        <p>sorry an error eocured</p>
        <p>exception</p>
        Exception is: <p> <%= exception %>  </p>
    </body>
</html>
