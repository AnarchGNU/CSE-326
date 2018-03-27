<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

  <head>
    <?php require_once 'includes/head.php'; ?>

    <!-- Title -->
    <title>PyFlicks - Movies</title>
  </head>

  <body>

    <header>
      <?php require_once 'includes/header.php'; ?>
    </header>

    <main>
      <div>

        <?php

          require_once 'includes/database.php';
          $movie_id = $_GET['id'];

          if(!$movie_id || empty($movie_id)) {
            echo 'Need to list popular movies here & also suggestions for the user.';
          } else {

            $movie = getMovieData($movie_id);
            $produce = getProducerData($movie_id);

            echo '<div class=movie-inf>';

            echo '<h3>Movie Information </h3> <br>';
            echo '<img class="movie-poster" src="images/' . $movie->poster . '">';
            echo 'Title: ' . $movie->title . '<br>';
            echo "Produced by: " . $produce->producer . '<br>';
            echo 'Genre: ' . $movie->genre . '<br>';
            echo 'Country: ' . $movie->country . '<br>';
            echo 'Released: ' . $movie->date . '<br>';
            echo 'Rating: ' . $movie->rating . '<br>';
            echo "ID: ". $movie_id . '<br>';

            echo "</div>";

            echo "<br>";

            echo "<h3>All Star Cast: </h3>";
            echo "<div class=cast>";


            	foreach (getActors($movie_id) as $cast) {
            		echo '<span class=actor> ' . $cast->character . " Played by: " . $cast->actor . '</span>';
            	}

            echo "</div>";

          }


        ?>

      </div>
    </main>

    <footer>
      <?php require_once 'includes/footer.php'; ?>
    </footer>

  </body>
</html>
