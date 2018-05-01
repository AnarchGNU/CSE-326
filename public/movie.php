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


          <?php

            require_once 'includes/database.php';
            $movie_id = $_GET['id'];

            if(!$movie_id || empty($movie_id)) {
              echo '<h3>No movie specified!/h3>';
              exit();
            } else {

              $movie = getMovieData($movie_id);
              $produce = getProducerData($movie_id);

              echo '<div class="movie-block">';

                echo '<h4 class="movie-header">' . $movie->title . '</h4>';
                echo '<div class="movie-item">';
                echo '<img class="movie-poster" src="images/' . $movie->poster . '">';

                if(isset($_SESSION["user"]) && $_SESSION["user"]) {
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
                      echo '<div class="interaction-link" onclick="watch_list_add(' . $movie->id . ', this), this">';
                        echo '<div class="interaction-text">Watch Later</div>';
                        echo '<div class="movie-add-button"><i class="fa fa-plus-circle"></i></div>';
                      echo '</div>';
                    echo '</div>';
                  }
                } else {
                  echo '<div class="movie-interaction save green">';
                    echo '<div class="interaction-link" onclick="showMessage(\'You must sign in to save movies.\')">';
                      echo '<div class="interaction-text">Save</div>';
                      echo '<div class="movie-add-button"><i class="fa fa-plus-circle"></i></div>';
                    echo '</div>';
                  echo '</div>';

                  echo '<div class="movie-interaction watch orange">';
                    echo '<div class="interaction-link" onclick="showMessage(\'You must sign in to save movies.\')">';
                      echo '<div class="interaction-text">Watch Later</div>';
                      echo '<div class="movie-add-button"><i class="fa fa-plus-circle"></i></div>';
                    echo '</div>';
                  echo '</div>';
                }


                echo '</div>';
                echo '<div class="tab-container">';
                  echo '<div class="tabs">';
                    echo '<a href="javascript:void(0)" onclick="openSummary()"><div id="summ-tab" class="tab tab-active">Summary</div></a>';
                    echo '<a href="javascript:void(0)" onclick="openInfo()"><div id="info-tab" class="tab">Info</div></a>';
                    echo '<a href="javascript:void(0)" onclick="openCast()"><div id="cast-tab" class="tab">Cast</div></a>';
                  echo '</div>';

                echo '<div class="movie-summ" id="movie-summ">';
                  echo '<p>' . $movie->summary . '</p>';
                echo '</div>';

                echo '<div class="movie-info" id="movie-info">';
                  echo '<p>Title: ' . $movie->title . '</p>';
                  echo '<p>Produced by: ' . $produce->producer . '</p>';
                  echo '<p>Genre: ' . $movie->genre . '</p>';
                  echo '<p>Country: ' . $movie->country . '</p>';
                  echo '<p>Released: ' . $movie->date . '</p>';
                  echo '<p>Rating: ' . $movie->rating . '</p>';
                  echo '<p>ID: ' . $movie_id . '</p>';
                echo '</div>';

                echo '<div class="movie-cast" id="movie-cast">';
                  echo '<h3>Cast:</h3>';
                  echo '<ul>';
                    foreach(getActors($movie_id) as $cast) {
                      echo '<li>' . $cast->actor . ': ' . $cast->character . '</li>';
                    }
                  echo '</ul>';
                echo '</div>';
              echo '</div>'; // tab container

              echo '</div>';

          }

          ?>


    </main>

    <footer>
      <?php require_once 'includes/footer.php'; ?>
    </footer>

    <script>

      function openInfo() {
        var info = document.getElementById("movie-info");
        var cast = document.getElementById("movie-cast");
        var summ = document.getElementById("movie-summ");

        document.getElementById("summ-tab").classList.remove("tab-active");
        document.getElementById("info-tab").classList.add("tab-active");
        document.getElementById("cast-tab").classList.remove("tab-active");

        info.style.display = "block";
        summ.style.display = "none";
        cast.style.display = "none";

      }

      function openCast() {
        var info = document.getElementById("movie-info");
        var cast = document.getElementById("movie-cast");
        var summ = document.getElementById("movie-summ");

        document.getElementById("summ-tab").classList.remove("tab-active");
        document.getElementById("info-tab").classList.remove("tab-active");
        document.getElementById("cast-tab").classList.add("tab-active");

        info.style.display = "none";
        summ.style.display = "none";
        cast.style.display = "block";
      }

      function openSummary() {
        var info = document.getElementById("movie-info");
        var cast = document.getElementById("movie-cast");
        var summ = document.getElementById("movie-summ");

        document.getElementById("cast-tab").classList.remove("tab-active");
        document.getElementById("info-tab").classList.remove("tab-active");
        document.getElementById("summ-tab").classList.add("tab-active");

        info.style.display = "none";
        cast.style.display = "none";
        summ.style.display = "block";
      }




    </script>

  </body>
</html>
