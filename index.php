<?php session_start(); ?>
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
          foreach(listMovies(12) as $movie) {
            echo '<a href="movie.php?id=' . $movie->id . '">';
            echo '<div class="movie-item">';
            echo '<img class="movie-poster" src="images/' . $movie->poster . '">';
            echo '<span class="movie-title">' . $movie->title . '</span>';
            echo '</div>';
            echo '</a>';
          }

        ?>

      </div>
    </main>

    <footer>
      <?php require_once 'includes/footer.php'; ?>
    </footer>

  </body>
</html>
