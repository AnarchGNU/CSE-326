<div class="left">
  <a href="index.php"><i class="fa fa-home"></i></a>
  <a href="recommendation.php">Recommendations</a>
</div>

<div class="right">
  <form action="results.php" method="get" class="search">
    <input type="text" name="search" placeholder="Search...">
  </form>

  <?php
    if(isset($_SESSION["login_token"]) && $_SESSION["login_token"]) {
        echo '<a href="account.php"><i class="fa fa-user"></i> ' . $_SESSION["user"]["first_name"] . '</a>';
        echo '<a href="user/logout.php"><i class="fa fa-sign-out-alt"></i></a>';
    } else {
      echo '<a href="login.php">Sign In</a> <span>/</span> <a href="register.php">Register</a>';
    }

  ?>


</div>
