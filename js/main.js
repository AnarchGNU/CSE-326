function addMovie(id) {

  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {

      console.log(this.responseText);

      if(this.responseText === "1") {
        console.log("huge success yess");
      } else {
        console.log(this.responseText);
      }
    }
  };

  xhttp.open("GET", "user/add_movie.php?id=" + id, true);
  xhttp.send();
}
