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

          if(empty($info["movies"])) {
            echo '<h5>You have no saved movies.</h5>';
            exit();
          } else {
            echo '<h5>Your saved movies:</h5>';
            echo '<div class="movie-grid">';

            foreach($info["movies"] as $movie) {
              echo '<div class="movie-item">';
                echo '<a href="movie.php?id=' . $movie->id . '">';
                  echo '<img class="movie-poster" src="images' . $movie->poster . '">';
                echo '</a>';
                echo '<a href="user/remove_movie.php?id=' . $movie->id . '"><div class="movie-remove">x</div></a>';
                echo '<span class="movie-title">' . $movie->title . '</span>';
              echo '</div>';
            }

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
