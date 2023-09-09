    
<%@page import="java.sql.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
        <c:catch var="ex">
        <jsp:useBean id ="lift" class="com.watad.philoPLus.classes.Lift" scope="request">
            <jsp:setProperty name="lift" property="po"/>
            <jsp:setProperty name="lift" property="liftNum"/>
            <jsp:setProperty name="lift" property="lift_type_id"/> 
            <jsp:setProperty name="lift" property="lift_floor_number"/>
            <jsp:setProperty name="lift" property="lift_well_num"/>
            <jsp:setProperty name="lift" property="startWork" value='<%=Date.valueOf(request.getParameter("startWork"))%>'/>
            <jsp:setProperty name="lift" property="num_work_day" />
            <jsp:setProperty name="lift" property="siteId" />
            <jsp:setProperty name="lift" property="companyID" />                  
        </jsp:useBean>
         <c:if test="${lift.createNewLift()==1}">
             <c:redirect url="GetLiftTypeCompanyName">
                 <c:param name="messageConent" value=".new Lift added"/>
             </c:redirect>
                
            </c:if>
          </c:catch>    
           <c:if test="${ex !=null}">
               <c:if test="${fn:contains(ex,'Duplicate entry')}">
                   <c:set var="ex" value="there is a lift with this Number ${param['liftNum']}"/>
               </c:if>
             <jsp:include page="creadtedLift.jsp">
                <jsp:param name="messageConent" value ="${ex}"/>
              </jsp:include>      
              <script>
                            document.getElementById('messageType').className = 'messageError';
                        </script>
           </c:if>
          
       
        
               
    </body>
</html>
