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
      // Paco's local environment
      $conn = mysqli_connect('localhost', 'root', 'newpassword', 'movie_recommend');
    } else {
      // Server environment
      $conn = mysqli_connect('localhost', 'movie_recommend', 'wBh]Kav%k)1)', 'movie_recommend');
    }
  }

  if(mysqli_connect_errno()) {
    echo 'Database Connection Failed.';
    return null;
  }

  $conn->set_charset("utf8");

  return $conn;
}

function listMovies($num, $page) {
    $conn = databaseConnect();

    $movies = array();

    $count = ($page * 25) - 25;

    $query = 'SELECT movie.movie_id, movie.title, movie.poster_path, simple_recommendation.score FROM simple_recommendation join movie where simple_recommendation.movie_id = movie.movie_id ORDER BY simple_recommendation.score DESC LIMIT ' . $count . ', ' . $num;

    $result = $conn->query($query);

    if($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
        $movie = new Movie();
        $movie->title = $row["title"];
        $movie->poster = $row["poster_path"];
        $movie->id = $row["movie_id"];

        if($movie->poster === "No image")
          $movie->poster = "/no_image.jpg";
          
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
  $movie->summary = $row["overview"];

  if($movie->poster === "No image")
    $movie->poster = "/no_image.jpg";

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
  $result["title"] = array();
  $result["actor"] = array();
  $result["production"] = array();

  // Title results
  $query = 'SELECT movie_id FROM movie WHERE title like "%'. $search . '%" ORDER BY votes_count DESC LIMIT 200';
  $result = $conn->query($query);

  while($row = $result->fetch_assoc()) {
    $results["title"][$row['movie_id']] = getMovieData($row['movie_id']);
  }


  // Actor results
  $query = 'SELECT movie_id FROM casts WHERE actor_name like "%'. $search . '%" LIMIT 200';
  $result = $conn->query($query);

  while($row = $result->fetch_assoc()) {
    $results["actor"][$row['movie_id']] = getMovieData($row['movie_id']);
  }

  // Production results
  $query = 'SELECT movie_id FROM production WHERE production like "%'. $search . '%" LIMIT 200';
  $result = $conn->query($query);

  while($row = $result->fetch_assoc()) {
    $results["production"][$row['movie_id']] = getMovieData($row['movie_id']);
  }

  return $results;
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
  if(md5($password) === $row["password"])
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
  $query->bind_param(ssss, $email, $first, $last, md5($password));
  $query->execute();

  return true;
}

function getUser($email) {
  $conn = databaseConnect();

  $user = array();
  $user["saved_list"] = array();
  $user["watch_list"] = array();
  $user["rated_list"] = array();

  $query = 'SELECT * FROM user_account WHERE email = "' . $email .'"';
  $result = $conn->query($query);
  $row = $result->fetch_assoc();

  $user["id"] = $row["user_id"];
  $user["first_name"] = $row["first_name"];
  $user["email"] = $email;

  // Setup saved_list
  $query = 'SELECT * FROM user_movies WHERE user_id = "' . $user["id"] . '"';
  $result = $conn->query($query);

  while($row = $result->fetch_assoc()) {
    $user["saved_list"][$row["movie_id"]] = getMovieData($row["movie_id"]);
  }

  // Setup watch_list
  $query = 'SELECT * FROM user_watch_list WHERE user_id = "' . $user["id"] . '"';
  $result = $conn->query($query);

  while($row = $result->fetch_assoc()) {
    $user["watch_list"][$row["movie_id"]] = getMovieData($row["movie_id"]);
  }

  // Setup rated_list
  $query = 'SELECT * FROM user_rated_list WHERE user_id = "' . $user["id"] . '"';
  $result = $conn->query($query);

  while($row = $result->fetch_assoc()) {
    $user["rated_list"][$row["movie_id"]] = getMovieData($row["movie_id"]);
    $user["rated_list"][$row["movie_id"]]->score = $row["score"];
  }

  return $user;

}


function getUserSession($email) {
  $conn = databaseConnect();

  $user = array();
  $user["saved_list"] = array();
  $user["watch_list"] = array();
  $user["rated_list"] = array();

  $query = 'SELECT * FROM user_account WHERE email = "' . $email .'"';
  $result = $conn->query($query);
  $row = $result->fetch_assoc();

  $user["id"] = $row["user_id"];
  $user["first_name"] = $row["first_name"];
  $user["email"] = $email;

  // Setup saved_list
  $query = 'SELECT * FROM user_movies WHERE user_id = "' . $user["id"] . '"';
  $result = $conn->query($query);

  while($row = $result->fetch_assoc()) {
    $user["saved_list"][$row["movie_id"]] = "1";
  }

  // Setup watch_list
  $query = 'SELECT * FROM user_watch_list WHERE user_id = "' . $user["id"] . '"';
  $result = $conn->query($query);

  while($row = $result->fetch_assoc()) {
    $user["watch_list"][$row["movie_id"]] = "1";
  }

  // Setup rated_list
  $query = 'SELECT * FROM user_rated_list WHERE user_id = "' . $user["id"] . '"';
  $result = $conn->query($query);

  while($row = $result->fetch_assoc()) {
    $user["rated_list"][$row["movie_id"]] = "1";
  }

  return $user;
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

function getUserRecommendations($email) {
  $conn = databaseConnect();

  $user = array();
  $user["movies"] = array();

  // Get name and user id for logged in user
  $query = 'SELECT * FROM user_account WHERE email = "' . $email . '"';
  $result = $conn->query($query);
  $row = $result->fetch_assoc();

  $user["id"] = $row["user_id"];

  // Get list of user's saved movies
  $query = 'SELECT * FROM user_based_recommendation WHERE user_id = "' . $user["id"] . '"';
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

function watchSaveMovie($email, $movieid) {
  $conn = databaseConnect();

  $query = $conn->prepare('INSERT INTO user_watch_list (user_id, movie_id) VALUES((SELECT user_id FROM user_account WHERE email = ?), ?)');
  $query->bind_param(ss, $email, $movieid);

  $query->execute();

  return true;

}

function watchRemoveMovie($email, $movieid) {
  $conn = databaseConnect();

  $query = $conn->prepare('DELETE FROM user_watch_list WHERE user_id = (SELECT user_id FROM user_account WHERE email = ?) AND movie_id = ?');
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



function getSavedRecommendations($email) {
  $conn = databaseConnect();

  $movies = array();

  // Get name and user id for logged in user
  $query = 'SELECT * FROM user_account WHERE email = "' . $email . '"';
  $result = $conn->query($query);
  $row = $result->fetch_assoc();

  $id = $row["user_id"];

  // Get list of user's saved movies
  $query = 'SELECT * FROM user_saved_recommendation WHERE user_id = "' . $user["id"] . '"';
  $result = $conn->query($query);

  while($row = $result->fetch_assoc()) {
    array_push($movies, getMovieData($row["movie_id"]));
  }

  return $movies;

}

function userRateMovie($email, $id, $score) {
  $conn = databaseConnect();

  $query = $conn->prepare('INSERT INTO user_rated_list (user_id, movie_id, score) VALUES((SELECT user_id FROM user_account WHERE email = ?), ?, ?)');
  $query->bind_param(ssi, $email, $id, $score);

  $query->execute();

  return true;
}



function userSaveRecommendation($email, $movieid) {
  $conn = databaseConnect();

  $query = $conn->prepare('INSERT INTO user_saved_recommendation (user_id, movie_id) VALUES((SELECT user_id FROM user_account WHERE email = ?), ?)');
  $query->bind_param(ss, $email, $movieid);

  $query->execute();

  return true;
}









?>
