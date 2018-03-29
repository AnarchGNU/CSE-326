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
          foreach(listMovies(14) as $movie) {
            echo '<div class="movie-item">';
              echo '<a href="movie.php?id=' . $movie->id . '">';
                echo '<img class="movie-poster" src="images' . $movie->poster . '">';
              echo '</a>';
              echo '<div class="movie-add" onclick="addMovie(' . $movie->id . ')">+</div>';
              echo '<span class="movie-title">' . $movie->title . '</span>';
            echo '</div>';
          }

        ?>

      </div>
    </main>

    <footer>
      <?php require_once 'includes/footer.php'; ?>
    </footer>

  </body>
</html>
