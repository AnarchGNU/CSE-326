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

class Cast {
  public $actor;
  public $character;
}

class Production {
  public $producer;
  public $movie_id;
}
/**
 * Establish a database connection.
 */

function databaseConnect() {

  static $conn;

  if($conn === NULL) {
    if($_SERVER['HTTP_HOST'] == "localhost") {

      $conn = mysqli_connect('localhost', 'root', 'newpassword', 'PyFlicks');
    } else {
      $conn = mysqli_connect('localhost', 'soco5_MovieUser', 'Y)_t8SeRT~If', 'soco5_PyFlicks');
    }
  }

  if(mysqli_connect_errno()) {
    echo 'Database Connection Failed.';
    return null;
  }

  $conn->set_charset("utf8");

  return $conn;
}

/**
 * Retrieve a list of num movies to display
 * on the home page.
 */

function listMovies($num) {

  $conn = databaseConnect();

  $movies = array();

  $query = 'SELECT title, poster_path, movie_id FROM movie WHERE release_date >= DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL -2 YEAR) AND avg_rating_imdb > 5 ORDER BY RAND() DESC LIMIT ' . $num;

  $result = $conn->query($query);

  if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
      $movie = new Movie();
      $movie->title = $row["title"];
      $movie->poster = $row["poster_path"];
      $movie->id = $row["movie_id"];
      array_push($movies, $movie);
    }
  } else {
    echo "no results";
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
  $genre = $genre["genre_name"];

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

/**
 * Retrieves production information about a movie
 */

function getProducerData($movie_id) {
  $conn = databaseConnect();

  $query = 'SELECT * FROM production WHERE movie_id = ' . $movie_id;

  $result = $conn->query($query);
  $row = $result->fetch_assoc();

  $produce = new Production();

  $produce->producer = $row["production"];
  $produce->movie_id = $movie_id;

  return $produce;
}

/**
 * Retrieves cast information from a movie
 */

function getActors($id) {
  $conn = databaseConnect();
  $actors = array();

  $query = 'SELECT * FROM casts WHERE movie_id = ' . $id;
  $result = $conn->query($query);

  if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
      $cast = new Cast();
      $cast->actor = $row["actor_name"];
      $cast->character = $row["character"];

      array_push($actors, $cast);

    }
  }

  return $actors;
}

/**
 * Search database by keyword.
 */

function searchFor($search) {

  $conn = databaseConnect();
  $results = array();

  // Title results
  $query = 'SELECT movie_id FROM movie WHERE title like "%'. $search . '%" ORDER BY votes_count DESC';
  $result = $conn->query($query);

  while($row = $result->fetch_assoc()) {
    array_push($results, getMovieData($row['movie_id']));
  }

  return $results;

  // Actor results


  // Production results

  // if (strcmp($by, 'Title') == 0) { //search by title
  //   if (strcmp($type, 'Exact') ==0) {
  //     $query = 'SELECT * FROM movie WHERE title = "'. $search . '"';
  //
  //   } else {
  //   //$query = 'SELECT *, LEVENSHTEIN(title, "' .$search .'") AS distance FROM movie WHERE LEVENSHTEIN(title, "com") < 5 ORDER BY distance DESC';
  //     $query = 'SELECT * FROM movie WHERE title like "%'. $search . '%"';
  //   }
  // } else   if (strcmp($by, 'Actor') == 0) { //search by actor
  //   if (strcmp($type, 'Exact') == 0) {
  //     $query = 'SELECT * FROM casts WHERE actor_name="'. $search . '"';
  //
  //   } else {
  //     $query = 'SELECT * FROM casts WHERE actor_name like "%'. $search . '%"';
  //   }
  // } else {//search by production
  //   if (strcmp($type, 'Exact') == 0) {
  //     $query = 'SELECT * FROM production WHERE production="'. $search . '"';
  //
  //   } else {
  //     $query = 'SELECT * FROM production WHERE production like "%'. $search . '%"';
  //   }
  // }
  //
  // $result = $conn->query($query);
  //
  // if($result->num_rows > 0) {
  //   while($row = $result->fetch_assoc()) {
  //     array_push($results, $row['movie_id']);
  //   }
  // } else {
  //   echo "no results";
  // }
  //
  //
  // return $results;
}


function validateLogin($email, $password) {
  $conn = databaseConnect();

  $query = 'SELECT * FROM user_account WHERE email = "' . $email . '"';
  $result = $conn->query($query);

  // Account not found
  if($result->num_rows != 1)
    return false;

  $row = $result->fetch_assoc();

  // Check passwords match
  if($password === $row["password"])
    return true;
  else
    return false;

}

function userExists($email) {
  $conn = databaseConnect();

  $query = 'SELECT * FROM user_account WHERE email = "' . $email . '"';
  $result = $conn->query($query);

  if($result->num_rows != 0)
    return true;
  else
    return false;
}

function createUserAccount($email, $first, $last, $password) {
  $conn = databaseConnect();

  $query = $conn->prepare('INSERT INTO user_account (email, first_name, last_name, password) VALUES(?, ?, ?, ?)');
  $query->bind_param(ssss, $email, $first, $last, $password);
  $query->execute();

  return true;
}

function getUserInfo($email) {
  $conn = databaseConnect();

  $user = array();
  $user["movies"] = array();

  // Get name and user id for logged in user
  $query = 'SELECT * FROM user_account WHERE email = "' . $email . '"';
  $result = $conn->query($query);
  $row = $result->fetch_assoc();

  $user["id"] = $row["user_id"];
  $user["first_name"] = $row["first_name"];

  // Get list of user's saved movies
  $query = 'SELECT * FROM user_movies WHERE user_id = "' . $user["id"] . '"';
  $result = $conn->query($query);

  while($row = $result->fetch_assoc()) {
    array_push($user["movies"], getMovieData($row["movie_id"]));
  }

  return $user;
}

function userAddMovie($email, $movieid) {
  $conn = databaseConnect();

  $query = $conn->prepare('INSERT INTO user_movies (user_id, movie_id) VALUES((SELECT user_id FROM user_account WHERE email = ?), ?)');
  $query->bind_param(ss, $email, $movieid);

  $query->execute();

  return true;

}

function userRemoveMovie($email, $movieid) {
  $conn = databaseConnect();

  $query = $conn->prepare('DELETE FROM user_movies WHERE user_id = (SELECT user_id FROM user_account WHERE email = ?) AND movie_id = ?');
  $query->bind_param(ss, $email, $movieid);

  $query->execute();

  return true;
}









?>
