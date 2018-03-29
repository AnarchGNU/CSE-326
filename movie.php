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
              echo '<h3>Need to list popular movies here & also suggestions for the user.</h3>';
            } else {

              $movie = getMovieData($movie_id);
              $produce = getProducerData($movie_id);

              echo '<div class="movie-block">';

                echo '<h4 class="movie-header">' . $movie->title . '</h4>';
                echo '<div class="movie-item">';
                echo '<img class="movie-poster" src="images/' . $movie->poster . '">';
                echo '<div class="movie-add" onclick="addMovie(' . $movie->id . ')">+</div>';
                echo '</div>';
                echo '<div class="tab-container">';
                  echo '<div class="tabs">';
                    echo '<a href="javascript:void(0)" onclick="openInfo()"><div id="info-tab" class="tab tab-active">Info</div></a>';
                    echo '<a href="javascript:void(0)" onclick="openCast()"><div id="cast-tab" class="tab">Cast</div></a>';
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

        document.getElementById("info-tab").classList.add("tab-active");
        document.getElementById("cast-tab").classList.remove("tab-active");

        info.style.display = "block";
        cast.style.display = "none";

      }

      function openCast() {
        var info = document.getElementById("movie-info");
        var cast = document.getElementById("movie-cast");

        document.getElementById("info-tab").classList.remove("tab-active");
        document.getElementById("cast-tab").classList.add("tab-active");

        info.style.display = "none";
        cast.style.display = "block";
      }




    </script>

  </body>
</html>
