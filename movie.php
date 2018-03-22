<!DOCTYPE html>
<html lang="en">

  <head>
    <?php require_once 'includes/head.php'; ?>

    <!-- Title -->
    <title>PyFlicks - Find New Movies</title>
  </head>

  <body>

    <header>
      <?php require_once 'includes/header.php'; ?>
    </header>

    <main>
      <div class="movie-grid">

        <?php

          require_once 'includes/database.php';
          $movie_id = $_GET['id'];
          $movie = getMovieData($movie_id);

          echo '<div class=movie-inf>';

          echo '<h3>Movie Information </h3> <br>';
          echo '<img class="movie-poster" src="images/' . $movie->poster . '">';
          echo 'Title: ' . $movie->title . '<br>';
          echo 'Genre: ' . $movie->genre . '<br>';
          echo 'Country: ' . $movie->country . '<br>';
          echo 'Released: ' . $movie->date . '<br>';
          echo 'Rating: ' . $movie->rating . '<br>';
          echo "ID: ". $movie_id . '<br>';
          
          echo "</div>";

        ?>

      </div>
    </main>

    <footer>
      <?php require_once 'includes/footer.php'; ?>
    </footer>

  </body>
</html>
