<%-- 
    Document   : login
    Created on : May 7, 2023, 10:50:52 AM
    Author     : Seha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        
        <jsp:useBean id ="login" class="com.watad.philoPLus.classes.User" scope="request">
            <jsp:setProperty name="login" property="userName"/>
            <jsp:setProperty name="login" property="passsword"/>
        </jsp:useBean>
        <c:choose>
            <c:when test="${login.chechLoginAvability()}">
                <c:set var="loginUserId" scope="session" value="${login.userIdFromDataBase}"/>
                <c:redirect url="menu.html"/>  
            </c:when>
            <c:otherwise>
                <script>
                                alert("Invalid User Name Or Password")
                            </script>
                <%@include file="index.html" %>%>
            </c:otherwise>        
        </c:choose>
    </body>
</html>
