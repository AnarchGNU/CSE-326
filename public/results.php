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

      <div>

        <?php

          require_once 'includes/database.php';

          if(!isset($_GET["search"]) || !$_GET["search"]) {
            echo '<h3>No search query entered.</h3>';
            exit();
          }

          $search = $_GET["search"];
          $results = searchFor($search);

          if(!$results["title"] || empty($results["title"])) {
            echo '<h3>No title results found.</h3>';
          } else {
            $length = count($results["title"]);

            // Print the movies in list
            echo '<h3>' . $length . ' results for titles matching "' . $search . '"</h3>';
            echo '<div>';
            echo '<ul class="movie_scroll">';

            foreach($results["title"] as $movie) {
              echo '<li class="movie-item">';
                echo '<a href="movie.php?id=' . $movie->id . '">';
                  echo '<img class="movie-poster" src="images' . $movie->poster . '">';
                echo '</a>';


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










                echo '<span class="movie-title">' . $movie->title . '</span>';
              echo '</li>';
            }

            echo '</ul>';
            echo "</div>";
          }


          if(!$results["actor"] || empty($results["actor"])) {
            echo '<h3>No actor results found.</h3>';
          } else {
            $length = count($results["actor"]);

            // Print the movies in list
            echo '<h3>' . $length . ' results for actors matching "' . $search . '"</h3>';
            echo '<div>';
            echo '<ul class="movie_scroll">';

            foreach($results["actor"] as $movie) {
              echo '<li class="movie-item">';
                echo '<a href="movie.php?id=' . $movie->id . '">';
                  echo '<img class="movie-poster" src="images' . $movie->poster . '">';
                echo '</a>';

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


                echo '<span class="movie-title">' . $movie->title . '</span>';
              echo '</li>';
            }

            echo '</ul>';
            echo "</div>";
          }

          if(!$results["production"] || empty($results["production"])) {
            echo '<h3>No production results found.</h3>';
          } else {
            $length = count($results["production"]);

            // Print the movies in list
            echo '<h3>' . $length . ' results for productions matching "' . $search . '"</h3>';
            echo '<div>';
            echo '<ul class="movie_scroll">';

            foreach($results["production"] as $movie) {
              echo '<li class="movie-item">';
                echo '<a href="movie.php?id=' . $movie->id . '">';
                  echo '<img class="movie-poster" src="images' . $movie->poster . '">';
                echo '</a>';

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
