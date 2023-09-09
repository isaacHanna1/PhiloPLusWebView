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
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
  </head>
  <body>
      <c:import url="navBar.html"/>
    <div class="container">
        <h1 >Create New Lift</h1>
      <div class="createLift">
          <form action="CreateNewLift.jsp" name="form">
             <div class="message" id ="messageType">
                ${param["messageConent"]}
            </div>
        <div class="create_row">
            <div class="col">
                <label>رقم المصعد :</label>
                <input type="text" placeholder="رقم المصعد" name ="liftNum" required />
            </div>
            <div class="col">
              <label>نوع المصعد :</label>
              <select size="1" name="lift_type_id">
                
                    <c:forEach var="listItem" items="${liftsType}">
                        <option value="${listItem.getId()}" >${listItem.getTypeOfLift()}</option>
                    </c:forEach>
               
            </select>
        </div>
        </div>
        <div class="create_row">
          <div class="col">
            <label>PO:</label>
            <input type="text" placeholder="PO" name="po" />
           </div>
          <div class="col">
            <label>عدد الادوار  :</label>
            <input type="number" placeholder="عدد الادوار" name="lift_floor_number" required/>
          </div>
        </div>
        <div class="create_row">
           <div class="col">
             <label>عدد الابيار: </label>
             <input type="number" placeholder="عدد الابيار " name="lift_well_num" required/>
            </div>
           <div class="col">
             <label>بداية العمل :</label>
             <input type="date" name="startWork" required>
           </div>
        </div>
           <div class="create_row">
             <div class="col">
              <label>عدد الايام للتسليم :</label>
              <input type="number"placeholder="عدد الايام للتسليم" name="num_work_day" required>
           </div>
           <div class="col">
             <label>يسلم يوم : </label>
             <input type="text"placeholder="يسلم يوم" disabled="true">
         </div>
        </div>
         <div class="create_row">
            <div class="col">
            <label>يتبع موقع : </label>
            <select size="1" name="siteId">
                <c:forEach var="site" items="${SiteList}">
                    <option value="${site.getId()}" >${site.getSiteName()}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col">
            <label>يتبع شركة : </label>
            <select size="1" name="companyID">
                <c:forEach var="company" items="${companyList}">
                    <option value="${company.getId()}" >${company.getCompany_name()}</option>
                </c:forEach>
            </select>
        </div>
         </div>
            <input class="btn-shape b-none fw-bold bg-blue c-white fs-15" type="submit" value="أنشاء" onclick ="checkRequiredFields()">
        </form>
        </div>
      </div>
    </div>
   
  </body>
</html>
