function post_link() {
  var http = new XMLHttpRequest();
  var url = "/api/short_url";
  var params = "complete_link=" + get_link();
  http.open("POST", url, true);

  http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

  http.onreadystatechange = function() {
    if(http.readyState == 4 && http.status == 200) {
      console.log("mensage successful!");
      // alert(http.responseText);
    } else {
      console.log("mensage failed!");
    }
  }

  http.send(params);
}

function get_link(){
  return document.getElementById('complete-url').value;
}

function send_url() {
  var link = get_link();
  debugger;
  if (link == "") {
    alert("it's not a valid URL ¬¬'");
  } else {
    post_link();
  }
}
