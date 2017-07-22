var alert = false;
setInterval(function() {
  var el = document.getElementsByClassName("ehD-box-limit")[0].children[0].text;
  ;
  if(!alert && parseInt(el.substring(14).substring(0, 4)) > 4800) {
    alert = true;
    document.body.innerHTML = "";
    alert("LIMIT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  }
  console.log("checking");
}, 1000);
