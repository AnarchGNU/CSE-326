<?php

/**
 * Establish a database connection.
 */

function databaseConnect() {

  static $conn;

  if($conn === NULL)
    $conn = mysqli_connect('localhost', 'root', 'newpassword', 'PyFlicks');

  if(mysqli_connect_errno()) {
    echo "Database Connection Failed: " . mysqli_connect_errno();
    return null;
  }

  return $conn;
}

class Movie {
  public $title;
  public $poster;
}

/**
 * Retrieve a list of num movies to display
 * on the home page.
 */

function listMovies($num) {

  $conn = databaseConnect();
  $movies = array();

  $query = "SELECT title, poster_path FROM movie ORDER BY avg_rating_imdb DESC LIMIT " . $num;
  $result = $conn->query($query);

  $movie;

  if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
      $movie = new Movie();
      $movie->title = $row["title"];
      $movie->poster = $row["poster_path"];
      array_push($movies, $movie);
    }
  }

  return $movies;
}

?>
