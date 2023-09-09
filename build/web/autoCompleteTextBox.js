let allLiftData =[{}];
let  allLiftNumber =[];
    fetch( "http://192.168.2.15:8080/PhipPlusWeb/api/lift/gettingLiftData")
        .then(response => response.json()).then(
        data =>{
            data.forEach(item =>{
                allLiftData.push(item);
                allLiftNumber.push(item.liftNum);
            });      
        }
        ).catch (error=>{
           console.log(Error+"  "+error); 
        });
 let input = document.getElementById("searchBox");
 input.value ='';

 let cleanBtn = document.getElementById("clear");
 cleanBtn.onclick = () => {
     input.value ='';
     removeElements();
 };
document.getElementById('arrowDown').onclick = function (){
    let content = document.getElementById("autoHeight");
    content.classList.toggle("maxHeight");
};
 input.addEventListener("keyup", (e) => {
   removeElements();
   for (let i of allLiftNumber) {
     if (i.startsWith(input.value) && input.value !== "") {
       let filterdList = document.createElement("li");
       filterdList.classList.add("listItems");
       filterdList.style.cursor = "pointer";
       filterdList.setAttribute("onclick", "displayNames('" + i + "')");
       
       let word = "";
       word =
         word +
         "<b>" +
         i.substring(0, input.value.length) +
         "</b>" +
         i.substring(input.value.length);

       filterdList.innerHTML = word;
       document.querySelector(".list").appendChild(filterdList);
     }
   }
 });
 function displayNames(value) {
   input.value = value;
    removeElements();
    for (var i = 0; i < allLiftNumber.length; i++) {
        if(allLiftNumber[i] === (value)){
            document.getElementById("liftNumber").innerHTML =allLiftData[i+1].liftNum;
            document.getElementById("lift_type").innerHTML = allLiftData[i+1].lift_type_details;
            document.getElementById("liftFloorNum").innerHTML = allLiftData[i+1].lift_floor_number;
            document.getElementById("liftWillNum").innerHTML = allLiftData[i+1].lift_well_num;
            document.getElementById("liftWillNum").innerHTML = allLiftData[i+1].lift_well_num;
            document.getElementById("liftComapny").innerHTML = allLiftData[i+1].campanyName;
            document.getElementById("liftSite").innerHTML = allLiftData[i+1].siteName;
            document.getElementById("startWork").innerHTML = allLiftData[i+1].startWork;
            document.getElementById("liftDaysNumber").innerHTML = allLiftData[i+1].num_work_day;
            document.getElementById("Finishdate").innerHTML = allLiftData[i+1].finsihDate;
            document.getElementById("liftId").value = allLiftData[i+1].id;
            document.getElementById("liftTypeId").value = allLiftData[i+1].lift_type_id;
            
            
        }
    }
    
 }
 
 function removeElements() {
    let content = document.getElementById("autoHeight");
    content.classList.toggle("maxHeight");
   let items = document.querySelectorAll(".listItems");
   if (items == null) {
     return;
   } else {
     items.forEach((item) => {
       item.remove();
     });
   }
 }