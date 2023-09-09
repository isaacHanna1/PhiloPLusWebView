<%@page import="java.util.Enumeration"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="javax.servlet.http.Part"%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
    </head>
    <body>
        <%

                    Enumeration<String>names =  request.getParameterNames();

                    while (names.hasMoreElements()) {
                            System.out.println(names.nextElement());
                        }
                    System.out.println(request.getParameter("liftId"));
                    System.out.println(request.getParameter("followingDetails"));
                    System.out.println(request.getParameter("progressId"));
                    
                    
                %>
        <c:catch var="ex">
        <jsp:useBean id="following" class="com.watad.philoPLus.classes.Following" scope="request">
            <jsp:setProperty name="following" property="id" value="${following.getIdFromDataBase()}"/>
            <jsp:setProperty name="following" property="liftId" />
            <jsp:setProperty name="following" property="followingDetails"/>
            <jsp:setProperty name="following" property="followingDate" value='<%= Date.valueOf(LocalDate.now()) %>'/>
            <jsp:setProperty name="following" property="imgPath"/>
            <jsp:setProperty name="following" property="progressId"/>
            <jsp:setProperty name="following" property="userId" value="${sessionScope.loginUserId}"/>
            <%
                         Part  filePart =  request.getPart("imgPath");
                         InputStream file =  following.fileToInputStream(filePart);
                         following.setFile(file);
                    %>
        </jsp:useBean>
        <c:if test="${following.insertNewFollowing()== 1}">
             <c:redirect url="insertNewFollowing.jsp"/>
            </c:if>
        </c:catch>
          <c:if test="${ex !=null}">
              <c:out value="${ex}"/>
               </c:if>
    </body>
</html>
