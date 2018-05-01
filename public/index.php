<?php

  session_start();

  if(!isset($_GET["page"]) || !$_GET["page"]) {
    $page = 1;
  } else {
    $page = $_GET["page"];
    if($page < 1)
      $page = 1;

    if($page > 10)
      $page = 10;
  }
?>

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

    <main style="display: block">

      <div style="margin-bottom: 10px">
        <h2 style="display: inline; padding: 10px">PyFlicks spotlight.</h2>

        <div class="pager">
          <a href="index.php?page=<?php echo $page - 1; ?>"><div><i class="fa fa-arrow-left"></i> Prev</div></a>
          <div class="pagenum"><?php echo $page; ?></div>
          <a href="index.php?page=<?php echo $page + 1; ?>"><div>Next <i class="fa fa-arrow-right"></i></div></a>
        </div>
      </div>






      <div class="movie-grid">

        <?php

          require_once 'includes/database.php';

          foreach(listMovies(25, $page) as $movie) {
            echo '<div class="movie-item">';
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
