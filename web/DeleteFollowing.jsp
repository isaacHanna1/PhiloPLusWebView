<%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
    <head>
        <meta charset="UTF-8" />
    </head>
    <body>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>        
        <jsp:useBean id="following" class="com.watad.philoPLus.classes.Following">
            <jsp:setProperty name="following" property="id"/>
            <jsp:setProperty name="following" property="liftId"/>

        </jsp:useBean>
        <c:if test="${following.deleteFollowing()== 1}">

            <%
                        String liftNum = request.getParameter("liftNum");
                        String liftId = request.getParameter("liftId");
                        System.out.println(liftNum);
                        String liftnumEncoded = java.net.URLEncoder.encode(liftNum,"UTF-8");
                        String url="pervious.jsp?liftId="+liftId+"&liftNum="+liftnumEncoded;
                        response.sendRedirect(url);
                    %>
            
        </c:if>
    </body>
</html>
