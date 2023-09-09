      
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="navBar.html"  %>
<html >
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/frameWork.css" />
    <link rel="stylesheet" href="style/normalize.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="style/master.css" />
    <title>Following</title>
    <style>
      .container {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        
      }
      .container h2 {
        font-size: 18px;
        margin-top: 10px;
      }
      .container .img {
        max-width: 150px;
        max-height: 150px;
        margin-top: 10px;
      }
      @media (max-width:767px){
      .container .img {
        width: 60px;
        height: 60px;
      }    
      }
      .container .img img {
        width: 100%;
        height: 100%;
      }
      .container .input label {
        display: block;
        text-align: center;
        font-size: 18px;
        font-weight: bold;
        margin-top: 10px;
      }
      .container .input input[type="date"] {
        padding: 10px;
        display: block;
        width: 300px;
        border: 1px solid #999;
        text-align: center;
        font-size: 15px;
        font-weight: bold;
        margin-top: 20px;
        border-radius: 10px;
      }
      .container .input input[type="date"]:focus {
        outline: none;
      }
      .container .input input[type="submit"] {
        padding: 10px;
        margin-top: 20px;
        width: 300px;
        font-size: 20px;
        font-weight: bold;
        background-color: #0075ff;
        color: white;
        border: none;
        border-radius: 10px;
      }
      .textInput{
          position: relative;
          z-index: 0;
      }
      .textInput i{
          position: absolute;
          top:50%;
          transform: translateY(-50%);
          right:10px;
          font-size: 30px;
          color: #777;
          z-index: 1;
          cursor: pointer;
      }
      ul {
        list-style: none;
      }
      .list {
        width: 300px;
        background-color: #ccc;
        border-radius: 10px 10px 10px 10px;
        margin-top: -1px;
        position: absolute;
        z-index: 2;
      }
      .listItems {
        padding: 10px 5px;
        font-size: 12px;
      }
      .listItems:hover {
        background-color: #ddd;
      }
      .lift_info{
        position: relative;
      }
      .arrow{
          border-width: 20px;
          border-style: solid;
          border-color: red transparent transparent transparent;
          position: absolute;
          left: 50%;
          transform: translateX(-50%);
          margin-top: 10px;
          z-index: 0;
          cursor: pointer;
          animation: up_downArrow .5s alternate infinite;
      }
        .lift_info .content{
          width: 100%;
          display: flex;
          justify-content: space-between;
          background: #eee;
          flex-wrap: wrap;
          margin-top: 30px;
          border-radius: 10px;
          visibility: hidden;
          transition: height .3s;
          margin-bottom: 20px;
      }
      .maxHeight{
          visibility: visible !important ;
      }
      .lift_info .info_row{
          width: 50%;
          padding: 10px;
          border-bottom: 1px solid #ddd;
          direction: rtl;
      }
      @media (max-width:768px){
          .lift_info .info_row{
              width: 100%;
              text-align: center;
          }
      }
      .lift_info .info_row label:first-child{
          font-size: 18px;
          font-weight: bold;
      }
      .lift_info .info_row label:last-child{
          font-size: 14px;
          padding-right: 5px;
      }
      
      @keyframes  up_downArrow{
          0%{
              top:0;
              border-width:25px;
          }
          100%{
              top:10px;
              border-width:20px;
          }
          
      }
      
    </style>
  </head>
  <body lang="AR" >
      <c:import url="navBar.html"/>
    <div class="container">
      <h2>Following</h2>
      <div class="img">
        <img src="style/images/lift.png" />
      </div>
      <form action="showFollowingReport.jsp">
        <div class="input">
          <label>  ادخل التاريخ</label>
          <div class="textInput"/>
              <input type="date" name="followingDate" id="searchBox" autocomplete="off" />
                   <input  type="submit" value="بحث"/>
          </div>
        </div>
     
      </form>
    </div>
  </body>
</html>
