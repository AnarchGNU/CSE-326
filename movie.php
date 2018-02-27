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

          echo $movie->title;
          echo $movie->id;
          echo $movie->poster;
          echo $movie->date;
          echo $movie->budget;

        ?>

      </div>
    </main>

    <footer>
      <?php require_once 'includes/footer.php'; ?>
    </footer>

  </body>
</html>
