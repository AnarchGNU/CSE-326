<?php
  session_start();

  // Redirect home if not logged in
  if(!isset($_SESSION["login_token"]) || !$_SESSION["login_token"]) {
    header("Location: index.php");
  }
?>
<!DOCTYPE html>
<html lang="en">

  <head>
    <?php require_once 'includes/head.php'; ?>

    <!-- Title -->
    <title>PyFlicks - Account</title>
  </head>

  <body>

    <header>
      <?php require_once 'includes/header.php'; ?>
    </header>

    <main>

      <div>

        <?php

          require_once 'includes/database.php';
          $info = getUserInfo($_SESSION["email"]);

          echo '<h3>Welcome Back, ' . $info["first_name"] . '.</h3>';
          echo '<h5>Your saved movies:</h5>';
          echo '<div class="movie-grid">';

          foreach($info["movies"] as $movie) {
            echo '<a href="movie.php?id=' . $movie->id . '">';
            echo '<div class="movie-item">';
            echo '<img class="movie-poster" src="images' . $movie->poster . '">';
            echo '<span class="movie-title">' . $movie->title . '</span>';
            echo '</div>';
            echo '</a>';
          }

          echo '</div>';

        ?>

      </div>


    </main>

    <footer>
      <?php require_once 'includes/footer.php'; ?>
    </footer>

  </body>
</html>
