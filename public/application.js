function send_url() {
  var link = get_link();

  if (link == "") {
    valid_url();
  } else {
    post_link(link);
  }
}

function get_link(){
  return document.getElementById('complete-url').value;
}

function post_link(link) {
  var http = new XMLHttpRequest();
  var url = "/api/short_url";
  var params = "complete_link=" + link;

  http.open("POST", url, false);
  http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  http.send(params);

  generate_response(http.responseText);
}

function generate_response(response) {
  response = JSON.parse(response);

  missed = document.getElementById('missed-link');
  missed.style.visibility = 'hidden';

  alert = document.getElementById('link-shorted');

  alert.style.visibility = 'visible';

  spans = alert.getElementsByClassName('link');

  spans[0].innerHTML = response.original_url;
  spans[0].href = response.original_url;

  spans[1].innerHTML = response.short_url;
  spans[1].href = response.short_url;

}

function valid_url() {
  missed = document.getElementById('missed-link');
  missed.style.visibility = 'visible';

  alert = document.getElementById('link-shorted');
  alert.style.visibility = 'hidden';

  spans = missed.getElementsByClassName('info-text');
  spans[0].innerHTML = "Please, inform a valid url :'(";
}
