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
          $info = getUser($_SESSION["email"]);

          echo '<h2>Welcome Back, ' . $info["first_name"] . '.</h2>';

          if(empty($info["saved_list"])) {
            echo '<h5>You have no saved movies.</h5>';
          } else {
            echo '<h5>Saved movies:</h5>';
            echo "<div>";
            echo '<ul class="movie_scroll">';

            foreach($info["saved_list"] as $movie) {
              echo '<li class="movie-item">';
                echo '<a href="movie.php?id=' . $movie->id . '">';
                  echo '<img class="movie-poster" src="images' . $movie->poster . '">';
                echo '</a>';

                echo '<div class="movie-interaction save red">';
                  echo '<div class="interaction-link" onclick="save_list_remove(' . $movie->id . ', this)">';
                  echo '<div class="interaction-text">Remove</div>';
                  echo '<div class="movie-add-button"><i class="fa fa-minus-circle"></i></div>';
                  echo '</div>';
                echo '</div>';


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


          if(empty($info["watch_list"])) {
            echo '<h5>You have no watch list movies.</h5>';
          } else {
            echo '<h5>Watch list:</h5>';
            echo "<div>";
            echo '<ul class="movie_scroll">';

            foreach($info["watch_list"] as $movie) {
              echo '<li class="movie-item">';
                echo '<a href="movie.php?id=' . $movie->id . '">';
                  echo '<img class="movie-poster" src="images' . $movie->poster . '">';
                echo '</a>';

                echo '<div class="movie-interaction red">';
                  echo '<div class="interaction-link" onclick="watch_list_remove(' . $movie->id . ', this)">';
                  echo '<div class="interaction-text">Remove</div>';
                  echo '<div class="movie-add-button"><i class="fa fa-minus-circle"></i></div>';
                  echo '</div>';
                echo '</div>';

                echo '<div class="movie-interaction watch orange">';
                  echo '<div class="interaction-link" onclick="window.location = \'rate.php?id=' . $movie->id . '\'">';
                  echo '<div class="interaction-text">Rate</div>';
                  echo '<div class="movie-add-button"><i class="fa fa-star"></i></div>';
                  echo '</div>';
                echo '</div>';

                echo '<span class="movie-title">' . $movie->title . '</span>';
              echo '</li>';
            }

            echo '</ul>';
            echo "</div>";
          }

          if(empty($info["rated_list"])) {
            echo '<h5>You have no rated movies.</h5>';
          } else {
            echo '<h5>Rated movies:</h5>';
            echo "<div>";
            echo '<ul class="movie_scroll">';

            foreach($info["rated_list"] as $movie) {
              echo '<li class="movie-item">';
                echo '<a href="movie.php?id=' . $movie->id . '">';
                  echo '<img class="movie-poster" src="images' . $movie->poster . '">';
                echo '</a>';

                if($movie->score < 5) {
                  echo '<div class="movie-score red">';
                    echo '<div class="interaction-text">' . $movie->score . '</div>';
                  echo '</div>';
                } else {
                  echo '<div class="movie-score green">';
                    echo '<div class="interaction-text">' . $movie->score . '</div>';
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
