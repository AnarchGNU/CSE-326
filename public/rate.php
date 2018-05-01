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
    <title>PyFlicks - Rate Movie</title>
  </head>

  <body>

    <header>
      <?php require_once 'includes/header.php'; ?>
    </header>

    <main>

      <div>

        <?php

          require_once 'includes/database.php';

          if(!isset($_GET["id"]) || !$_GET["id"]) {
            echo '<h3>No movie id specified.</h3>';
            exit();
          }

          $movie = getMovieData($_GET["id"]);

          echo '<h3 style="text-align: center">Let us know how good our recommendation was.</h3>';

          echo '<div class="movie-item center">';
            echo '<a href="movie.php?id=' . $movie->id . '">';
              echo '<img class="movie-poster" src="images' . $movie->poster . '">';
            echo '</a>';
            echo '<span class="movie-title">' . $movie->title . '</span>';
          echo '</div>';

        ?>

        <div class="rating">
          <div>1</div>
          <div>2</div>
          <div>3</div>
          <div>4</div>
          <div>5</div>
          <div>6</div>
          <div>7</div>
          <div>8</div>
          <div>9</div>
          <div>10</div>
        </div>

      <form action="user/rateMovie.php" method="post" class="center form">
          <input type="number" class="rating-input"  min="0.0" max="10.0" name="score"><br>
          <input type="hidden" value="<?php echo $movie->id; ?>" name="id"><br>
          <input type="submit" class="submit"><br>
      </form>

      </div>

    </main>

    <footer>
      <?php require_once 'includes/footer.php'; ?>
    </footer>

  </body>
</html>
