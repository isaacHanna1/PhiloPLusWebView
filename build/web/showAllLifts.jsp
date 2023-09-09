<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/frameWork.css" />
    <link rel="stylesheet" href="style/normalize.css" />
    <link rel="stylesheet" href="style/master.css" />
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>our lifts</title>
    <style>
      .container h1 {
        background-color: #0075ff;
        color: white;
        padding: 15px;
        text-align: center;
        border-radius: 15px;
      }
      .container table {
        width: 100%;
      }
      table tr:first-child {
        font-size: 16px;
        font-weight: bold;
        color: #0075ff;
      }
      table tr {
        display: flex;
        justify-content: space-between;
        padding: 15px;
        border-bottom: 1px solid #999;
        font-size: 14px;
        font-weight: 600;
      }
      table tr td {
        flex-basis: 120px;
        flex-grow: 1;
        text-align: center;
      }
      @media (max-width: 767px) {
          table tr{
              width: 100%;
              padding:3px 0px;
          }
          table tr td:first-child{
              max-width: 50px;
          }
          table tr td {
            max-width: 100px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            padding: 3px 3px ;
          }
          table tr td:nth-child(2) {
              display:hidden;
          }
      }
      .pages {
          padding: 15px 0;
          font-size: 14px;
      }
      .ErrorMessage{
          font-size: 16px;
          width: fit-content;
          margin: 10px auto;
          font-weight: 700;
          color:red;
      }
    </style>
  </head>
  <body>
              <c:import url="navBar.html"/>

    <div class="container">
      <h1>Lifts</h1>
        <div class = "ErrorMessage">
            ${param.message}
        </div>
      <table>
        <tr>
          <td>ID</td>
          <td>Lift Number</td>
          <td>Site</td>
          <td>Delete</td>
          <td>Edit</td>
        </tr>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <jsp:useBean id ="lift" class="com.watad.philoPLus.classes.Lift"/>
      
      <c:set var="y" value='<%=request.getParameter("startRecord")%>'/>
      <c:set var="x" value='<%=request.getParameter("endRecord")%>'/>
      <c:set var="listOfLifts" value="${lift.retriveLiftDate(y,x)}" />
      <c:forEach var="putData" items="${listOfLifts}">
        <tr>
          <td>${putData.getId()}</td>
          <td>${putData.getLiftNum()}</td>
          <td>${putData.getSiteName()}</td>
          <td><a href="DeleteLift.jsp?startRecord=${y}&endRecord=${x}&liftId=${putData.getId()}">Del</a></td>
          <td><a href="GetLiftTypeCompanyName?startRecord=${y}&endRecord=${x}&liftId=${putData.getId()}">edit</a></td>
        </tr>
        </c:forEach>
      </table>
      <div class="pages">
        pages :
        <c:set var="numOfPages" value="${lift.numberOfPageToDistributeRecordsOfOurLiftTableToPage()}"/>
        <c:forEach var="page" begin="0" end="${numOfPages-1}">
            <c:set var="start" value="${page * 10}"/>
            <c:set var="end" value="${start + 10}"/>
            <a href="showAllLifts.jsp?startRecord=${start}&endRecord=${end}">${page}</a>
        </c:forEach>
        
      </div>
    </div>
  </body>
</html>
