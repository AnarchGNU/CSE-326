<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

  <head>
    <?php require_once 'includes/head.php'; ?>

    <!-- Title -->
    <title>PyFlicks - Search Results</title>
  </head>

  <body>

    <header>
      <?php require_once 'includes/header.php'; ?>
    </header>

    <main>

        <?php

          require_once 'includes/database.php';

          if(!isset($_GET["search"])) {
            echo '<h3>No search query entered.</h3>';
            exit();
          }

          $search = $_GET["search"];
          $results = searchFor($search);

          if(!$results || empty($results)) {
            echo '<h3>No results found.</h3>';
          } else {

            $length = count($results);


            // Print the movies in list
            echo '<h3>' . $length . ' movie results for "' . $search . '"</h3>';
            echo '<div class="movie-grid">';

            foreach($results as $movie) {
              echo '<div class="movie-item">';
                echo '<a href="movie.php?id=' . $movie->id . '">';
                  echo '<img class="movie-poster" src="images' . $movie->poster . '">';
                echo '</a>';
                echo '<div class="movie-add" onclick="addMovie(' . $movie->id . ')">+</div>';
                echo '<span class="movie-title">' . $movie->title . '</span>';
              echo '</div>';
            }

            echo '</div>';
          }







        ?>

    </main>

    <footer>
      <?php require_once 'includes/footer.php'; ?>
    </footer>

  </body>
</html>
