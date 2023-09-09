let myRequest = new XMLHttpRequest();
myRequest.open("Get", "https://api.github.com/users/elzerowebschool/repos");
myRequest.send();
myRequest.onreadystatechange = function () {
  if (myRequest.readyState === 4 && myRequest.status === 200) {
    let jSData = JSON.parse(this.responseText);
    for (let i = 0; i <= jSData.length; i++) {
      let div = document.createElement("div");
      let repName = document.createTextNode(jSData[i].full_name);
      div.appendChild(repName);
      document.body.appendChild(div);
    }
  }
};
