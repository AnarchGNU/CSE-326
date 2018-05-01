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

        // User is not logged in
        if(!isset($_SESSION["login_token"]) || !$_SESSION["login_token"]) {
          echo '<h3>You must be logged in to get recommendations!</h3>';
          exit();
        }

        require_once 'includes/database.php';
        $info = getUserRecommendations($_SESSION["email"]);

        if(empty($info["movies"])) {
          echo '<h3>You do not have any movie recommendations. Some will be generated soon!</h3>';
          exit();
        } else {
          echo '<h5>Recommended for you:</h5>';
          echo "<div>";
          echo '<ul class="movie_scroll">';

          foreach($info["movies"] as $movie) {
            echo '<li class="movie-item">';
              echo '<a href="movie.php?id=' . $movie->id . '">';
                echo '<img class="movie-poster" src="images' . $movie->poster . '">';
              echo '</a>';


              if(array_key_exists($movie->id, $_SESSION["user"]["saved_list"])) {
                echo '<a href="account.php"><div class="movie-interaction save gray">';
                  echo '<div class="interaction-link">';
                    echo '<div class="interaction-text">Saved</div>';
                    echo '<div class="movie-add-button"><i class="fa fa-check-circle"></i></div>';
                  echo '</div>';
                echo '</div></a>';
              } else {
                echo '<div class="movie-interaction save green">';
                  echo '<div class="interaction-link" onclick="save_list_add(' . $movie->id . ', this)">';
                    echo '<div class="interaction-text">Save</div>';
                    echo '<div class="movie-add-button"><i class="fa fa-plus-circle"></i></div>';
                  echo '</div>';
                echo '</div>';
              }

              if(array_key_exists($movie->id, $_SESSION["user"]["watch_list"])) {
                echo '<a href="account.php"><div class="movie-interaction watch gray">';
                  echo '<div class="interaction-link">';
                    echo '<div class="interaction-text">Watch List</div>';
                    echo '<div class="movie-add-button"><i class="fa fa-check-circle"></i></div>';
                  echo '</div>';
                echo '</div></a>';
              } else {
                echo '<div class="movie-interaction watch orange">';
                  echo '<div class="interaction-link" onclick="watch_list_add(' . $movie->id . ', this)">';
                    echo '<div class="interaction-text">Watch Later</div>';
                    echo '<div class="movie-add-button"><i class="fa fa-plus-circle"></i></div>';
                  echo '</div>';
                echo '</div>';
              }

              echo '<span class="movie-title">' . $movie->title . '</span>';
            echo '</li>';
          }

          echo '</ul>';
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
