<%-- 
    Document   : DeleteLift.jsp
    Created on : May 11, 2023, 10:27:22 AM
    Author     : Seha
--%>

 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    </head>
    <body>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
         <jsp:useBean id ="lift" class="com.watad.philoPLus.classes.Lift"/>
         <c:set var="id" value='<%=request.getParameter("liftId")%>'/>
         <c:catch var="ex">
         <c:set var="isDeleted" value="${lift.deleteLift(id)}"/>
            <c:if test="${isDeleted == 1}">
                <c:set var="y" value='<%=request.getParameter("startRecord")%>'/>
                <c:set var="x" value='<%=request.getParameter("endRecord")%>'/>
                <c:redirect url="showAllLifts.jsp?startRecord=${y}&endRecord=${x}"/>
            </c:if>
            </c:catch>
         <c:if test="${ex !=null}">
                <c:set var="message" value="you can`t delete it , it`s connected to other table "/>
                <c:set var="y" value='<%=request.getParameter("startRecord")%>'/>
                <c:set var="x" value='<%=request.getParameter("endRecord")%>'/>
                <c:import url="showAllLifts.jsp?startRecord=${y}&endRecord=${x}&message=${message}"/>
        </c:if>
    </body>
</html>
