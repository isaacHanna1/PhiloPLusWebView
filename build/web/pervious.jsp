<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="style/frameWork.css" />
    <link rel="stylesheet" href="style/normalize.css" />
    <link rel="stylesheet" href="style/master.css" />
    <title>المتابعات السابقة</title>

    <style>
      .container #liftNumber {
        width: 250px;
        padding: 15px;
        margin: 20px auto;
        background-color: #10cab7;
        color: #fff;
        border-radius: 10px;
        text-align: center;
        font-size: 22px;
        font-weight: 600;
      }
      .container .tableContainer {
        display: flex;
        justify-content: center;
        border: 1px solid #ddd;
        border-radius: 10px;
        direction: rtl;
        height: 90vh;
      }
      .tableContainer table {
        width: 100%;
      }
      .tableContainer table tr {
        border-bottom: 1px solid #ddd;
        display: flex;
        justify-content: space-between; 
        padding: 10px 3px;
        transition: .3s;
      }
      .tableContainer table tr td {
        text-align: center;
        font-size: 14px;
        padding: 10px;
        width: calc(100%/4);
      }
      .tableContainer table tr:hover{
          background-color: #ddd;
          cursor: pointer;
      }
      @media (max-width:768px){
          .tableContainer table tr td{
              width: calc(100%/4);
          }
      .tableContainer table tr td:first-child{
          display: none;
      }
      .tableContainer table tr td:nth-child(2){
          max-width:80px; 
          overflow: hidden;
          white-space: nowrap;
          text-overflow: ellipsis;
      }
      .tableContainer table tr td:nth-child(3){
          flex-grow: 10;
      }
      }

      .tableContainer table tr:first-child {
        font-size: 18px;
        font-weight: bold;
      }
    </style>
  </head>
  <body>
    <%@include file="navBar.html" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div class="container">
      <c:set var="liftNumber" value="${param.liftNum}"/>
      <h2 id="liftNumber">${liftNumber}</h2>
      <div class="tableContainer">
        <table>
          <tr>
            <td>م</td>
            <td>التاريخ</td>
            <td class="pervious">تفاصيل المتابعة</td>
            <td>Del</td>
          </tr>
          <jsp:useBean id="following" class="com.watad.philoPLus.classes.Following">
              <jsp:setProperty name="following" property="liftId"  value="${param.liftId}"/>
              <c:set var ="perFollowing" value='${following.getPerviousFollowingForLift()}'/>
          </jsp:useBean>
          <c:forEach var="items" items="${perFollowing}">
            
              <tr>
                  
                    <td>${items.getId()}</td>
                    <td>${items.getFollowingDate()}</td>
                    <td><a href="downloadImg?followingId=${items.getId()}">${items.getFollowingDetails()}</a></td>
                    <c:set var="liftNum" value="${param.liftNum}"/>
                    <td><a href="DeleteFollowing.jsp?id=${items.getId()}&liftId=${param.liftId}&liftNum=${liftNum}">Del</a></td>
                   
              </tr>
             
          </c:forEach>
        </table>
      </div>
    </div>
  </body>
</html>
