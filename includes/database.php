<?php

class Movie {
  public $title;
  public $poster;
  public $id;
  public $genre;
  public $budget;
  public $year;
  public $rating;
  public $country;
  public $date;
}

/**
 * Establish a database connection.
 */

function databaseConnect() {

  static $conn;

  if($conn === NULL)
    $conn = mysqli_connect('localhost', 'root', 'newpassword', 'PyFlicks');

  if(mysqli_connect_errno()) {
    echo 'Database Connection Failed.';
    return null;
  }

  return $conn;
}

/**
 * Retrieve a list of num movies to display
 * on the home page.
 */

function listMovies($num) {

  $conn = databaseConnect();
  $movies = array();

  // SELECT title FROM movie WHERE release_date >= DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL -10 YEAR) LIMIT 10

  $query = 'SELECT title, poster_path, movie_id FROM movie ORDER BY avg_rating_imdb DESC LIMIT ' . $num;
  $result = $conn->query($query);

  if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
      $movie = new Movie();
      $movie->title = $row["title"];
      $movie->poster = $row["poster_path"];
      $movie->id = $row["movie_id"];
      array_push($movies, $movie);
    }
  }

  return $movies;
}

function getMovieData($id) {

  $conn = databaseConnect();

  $query = 'SELECT * FROM movie WHERE movie_id = ' . $id . ' LIMIT 1';
  $result = $conn->query($query);
  $row = $result->fetch_assoc();

  $query = 'SELECT * FROM movie_genre WHERE movie_id = ' . $id . ' LIMIT 1';
  $result = $conn->query($query);
  $genre = $result->fetch_assoc();
  $genre = $genre["genre"];

  $movie = new Movie();
  $movie->title = $row["title"];
  $movie->poster = $row["poster_path"];
  $movie->id = $id;
  $movie->genre = $genre;
  $movie->budget = $row["budget"];
  $movie->year = $row["year"];
  $movie->rating = $row["avg_rating_imdb"];
  $movie->country = $row["country"];
  $movie->date = $row["release_date"];

  return $movie;
}

?>
