<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style/frameWork.css" />
    <link rel="stylesheet" href="style/normalize.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="style/master.css" />
    <title>Following</title>
    <style>
      .formFollowing {
        border: 1px solid #eee;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 1px 0 1px #ddd;
        width: 100%;
        margin-bottom: 20px;
      }
      .formFollowing .content {
        padding: 5px;
      }
      .formFollowing textarea {
        resize: none;
        width: 100%;
        height: 180px;
        padding: 10px;
        text-align: right;
        font-size: 14px;
        border-radius: 10px;
        border: 1px solid #ccc;
      }
      textarea:hover {
        outline: none;
      }
      .container{
        display: flex;
        align-items: center;
        flex-direction: column;
        height: 100vh;
      }
      .container h2{
          font-size: 22px;
          width: 50%;
          background-color: #10cab7;
          color: #fff;
          margin: auto;
          text-align: center;
          padding: 10px;
          border-radius: 10px;
          margin: 20px auto;
      }     
      .container .formFollowing {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
      }
      .formFollowing > div {
        width: 50%;
      }
      @media (max-width: 768px) {
        .formFollowing > div {
          width: 100%;
        }
      }
      .formFollowing .img {
        display: flex;
        justify-content: center;
        align-items: center;
        align-self: center;
        max-width: 250px;
        max-width: 200px;
        margin: auto;
           
      }
      @media (max-width:768px){
          .formFollowing .img {
            max-width: 200px;
            max-width: 100px;
          }
          
      }
      .formFollowing .img i {
        color: #888;
      }
      .formFollowing .img img{
          width: 100%;
          height: 100%;   
      }
      .formFollowing label {
        display: block;
        text-align: center;
        font-size: 16px;
        font-weight: bold;
        padding: 10px;
        color: #0075ff;
      }
      .formFollowing select {
        width: 100%;
        padding: 10px;
        text-align: center;
        direction: rtl;
      }
      .formFollowing select option{
          font-size: 14px;
      }
      .formFollowing .btn {
        width: 100%;
        margin-top: 20px;
      }
      .formFollowing .btn {
          widows: 100%;
          text-align: center
      }
      .formFollowing .btn input[type='submit'] {
        margin: auto;
        padding: 10px;
        font-weight: 600;
        font-size: 18px;
        border: none;
        background-color: #0075ff;
        color: white;
        border-radius: 10px;
        margin-left: 10px;
        cursor: pointer;
      }
      .formFollowing .btn a{
          background-color: #10cab7;
          color: #fff;
          display: inline-block;
          padding: 10px;
          border-radius: 10px;
          text-decoration: none;
          font-size: 18px;
          font-weight: 600;
          margin-right: 10px;
      }
      .formFollowing .lbl_addImg input[type='file']{
          display: none;
      }
      .formFollowing .lbl_addImg{
        text-overflow: ellipsis;
        width: 100%;
        color: #0075ff;
        margin-top: 10px;
      }
      .formFollowing .lbl_addImg::after{
          content: "\f56f";
          font-family: "Font Awesome 5 Free"; 
          font-weight: 900; 
          display: block;
          font-size: 22px;
          margin-top: 5px;
          animation: increaseAndDecrease .7s alternate infinite;
      }
      @keyframes increaseAndDecrease{
          
          0%{
             transform: scale(1)
          }
          0%{
             transform: scale(1.2)
          }
      }
    </style>
  </head>
  <body>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@include file="navBar.html" %>
    <div class="container">
         <h2 id="liftNumHeading"> </h2>
         <form  action="AddNewFollowingServlet" method="Post"  enctype="multipart/form-data" class="formFollowing" >
        <div class="img" id="imgContainer">
          <i class="fa-solid fa-photo-film fa-3x"></i>
        </div>
        <div class="content">
          <label>تفاصيل المتابعة</label>
          <textarea name="followingDetails"></textarea>
          <input type="hidden" name="liftId" id="liftId" value="29"/>
          <label>نسبة من التسليم</label>
          <select id ="selectProgressDetails" name="progressId" >
          </select>
          <label for="lbl_inputImage" class="lbl_addImg">إضافة صورة
          <input type ="file" name="imgPath" id ="lbl_inputImage" >
          </label>
        </div>
        <div class="btn">

            <c:set var="liftNum" value="${param.liftNum}"/>
            <c:set var="liftId"  value="${param.liftId}"/>
          <a href="pervious.jsp?liftNum=${liftNum}&liftId=${liftId}">المتابعات السابقة</a>
          <input type="submit" value="إضافة المتابعة" />
        </div>     
        </div>
        
           
      </form>
    </div>

      <script>
          
 function findGetParameter(parameterName) {
    var result = null,
        tmp = [];
    location.search.substr(1).split("&").forEach(function (item) {
          tmp = item.split("=");
          if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
        });
    return result;
}
          let headingContentH2 = findGetParameter('liftNum');
          headingContentH2 = headingContentH2.split('+').join(' ');
          let elementH2Heading = document.getElementById('liftNumHeading');
          elementH2Heading.innerHTML = headingContentH2;
          let liftTypeId = findGetParameter("liftTypeId");
          let selectElement = document.getElementById("selectProgressDetails");   
          let liftId =  document.getElementById("liftId");   
          liftId.value=findGetParameter('liftId');
          liftId.innerHTML=findGetParameter('liftId');
          fetch( "http://192.168.2.15:8080/PhipPlusWeb/api/lift/gettingLiftProgress/"+liftTypeId)
                  .then(response => response.json()).then( data =>{
            data.forEach(item =>{
                let option = document.createElement("option");
                option.value = item.liftProgressDetails + "    " + item.ratio + " %";
                option.innerHTML = item.liftProgressDetails + "   " + item.ratio + " %";
                option.setAttribute("value",item.id);
                selectElement.appendChild(option);
            });
        }
                ).catch (error=>{
           console.log(Error+"  "+error); 
        });
        
        const imgInput = document.querySelector("#lbl_inputImage");
        const imgContainer = document.querySelector("#imgContainer");
        imgInput.addEventListener('change', function (){
            if(this.files && this.files[0]){
                const file = this.files[0];
                const reader = new FileReader();
                reader.onload = function (e){
                    const  imgeElement = document.createElement('img');
                    imgeElement.src = e.target.result;
                    imgeElement.name='imgItself';
                    imgContainer.innerHTML = "";
                    imgContainer.appendChild(imgeElement);
                }
                        reader.readAsDataURL(file);
                         console.log(reader.readAsDataURL(file));   
            }
        });
      </script>
  </body>
</html>
