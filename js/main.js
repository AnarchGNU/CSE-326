function addMovie(id) {

  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {

      var message = document.getElementById("message");

      if(this.responseText === "1") {
        message.innerHTML = "Successfully saved this movie.";
        message.style.display = "block";

        setTimeout(function() {
          message.style.display = "none";
        }, 3000);
      } else {
        message.innerHTML = "You must sign in to save movies.";
        message.style.display = "block";

        setTimeout(function() {
          message.style.display = "none";
        }, 3000);
      }
    }
  };

  xhttp.open("GET", "user/add_movie.php?id=" + id, true);
  xhttp.send();
}
