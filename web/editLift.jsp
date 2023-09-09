<%-- 
    Document   : editLift
    Created on : May 11, 2023, 1:50:40 PM
    Author     : Seha
--%>


<!DOCTYPE html>
<html>
    <head>
        <title>Philo</title>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <link rel="stylesheet" href="style/frameWork.css" />
            <link rel="stylesheet" href="style/normalize.css" />
            <link rel="stylesheet" href="style/master.css" />
            <link rel="stylesheet" href="${pageContext.request.contextPath}/style/createdLift.css" />
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@page contentType="text/html" pageEncoding="UTF-8"%>
    </head>
    <body>
        <c:import url="navBar.html"/>
        <c:set var="liftId" value="${param.liftId}"/>
        <jsp:useBean id="lift" class="com.watad.philoPLus.classes.Lift">
         <c:set var="liftObj" value="${lift.gettingLiftDataById(liftId)}"/>
        </jsp:useBean>
        
        <div class="container">
        <h1 >Edit lift Data</h1>
      <div class="createLift">
          <form action="editLiftAction.jsp" name="form">
                <c:set var="y" value='<%=request.getParameter("startRecord")%>'/>
                <c:set var="x" value='<%=request.getParameter("endRecord")%>'/>
                <input type="text" hidden="hidden" name="startRecord" value="${y}"/>
                <input type="text" hidden="hidden" name="endRecord" value="${x}"/>
                <input type="text" hidden="hidden" name="id" value="${liftId}"/>
             <div class="message" id ="messageType">
                ${param["messageConent"]}
            </div>
        <div class="create_row">
            <div class="col">
                <label>رقم المصعد :</label>
                <input type="text" placeholder="رقم المصعد" name ="liftNum" required  value ="${liftObj.getLiftNum()}"/>
            </div>
            <div class="col">
              <label>نوع المصعد :</label>
              <select size="1" name="lift_type_id" value="${liftObj.getLift_type_details()}">
                
                    <c:forEach var="listItem" items="${liftsType}" >
                        <c:choose>
                            <c:when test="${listItem.getTypeOfLift() eq liftObj.getLift_type_details() }">
                                <option selected="selected" value="${listItem.getId()}" >${listItem.getTypeOfLift()}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${listItem.getId()}" >${listItem.getTypeOfLift()}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
               
            </select>
        </div>
        </div>
        <div class="create_row">
          <div class="col">
            <label>PO:</label>
            <input type="text" placeholder="PO" name="po"  value ="${liftObj.getPo()}"/>
           </div>
          <div class="col">
            <label>عدد الادوار  :</label>
            <input type="number" placeholder="عدد الادوار" name="lift_floor_number" value="${liftObj.getLift_floor_number()}" required/>
          </div>
        </div>
        <div class="create_row">
           <div class="col">
             <label>عدد الابيار: </label>
             <input type="number" placeholder="عدد الابيار " name="lift_well_num" value ="${liftObj.getLift_well_num()}" required/>
            </div>
           <div class="col">
             <label>بداية العمل :</label>
             <input type="date" name="startWork" value ="${liftObj.getStartWork()}"required>
           </div>
        </div>
           <div class="create_row">
             <div class="col">
              <label>عدد الايام للتسليم :</label>
              <input type="number"placeholder="عدد الايام للتسليم" name="num_work_day" value="${liftObj.getNum_work_day()}" required>
           </div>
           <div class="col">
             <label>يسلم يوم : </label>
             <input type="text"placeholder="يسلم يوم" value="${liftObj.getFinsihDate()}" disabled="true">
         </div>
        </div>
         <div class="create_row">
            <div class="col">
            <label>يتبع موقع : </label>
            <select name="siteId" value ="${liftObj.getSiteName()}">
               
                <c:forEach var="site" items="${SiteList}">
                    <c:choose>
                        <c:when test="${site.getSiteName() eq liftObj.getSiteName()}">
                            <option selected="selected" value="${site.getId()}" >${site.getSiteName()}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${site.getId()}" >${site.getSiteName()}</option>
                        </c:otherwise>
                    </c:choose>
               </c:forEach>
 
            </select>
        </div>
        <div class="col">
            <label>يتبع شركة : </label>
            <select name="companyID" value="${liftObj.getCampanyName()}">
                <c:forEach var="company" items="${companyList}">
                  <c:choose>
                    <c:when test="${company.getCompany_name() eq liftObj.getCampanyName()}">
                        <option selected="selected" value="${company.getId()}" >${company.getCompany_name()}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${company.getId()}" >${company.getCompany_name()}</option>    
                    </c:otherwise>
                  </c:choose> 
                </c:forEach>
            </select>
        </div>
         </div>
         
            <input class="btn-shape b-none fw-bold bg-blue c-white fs-15" type="submit" value="تعديل">
        </form>
        </div>
      </div>
    </div>
   
    </body>
</html>
