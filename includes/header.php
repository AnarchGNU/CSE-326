<div class="left">
  <a href="index.php">Home</a>
  <a href="recommendation.php">Recommendations</a>
</div>

<div class="right">
  <form action="results.php" method="get" class="search">
    <input type="text" name="search" placeholder="Search...">
  </form>

  <?php
    if(isset($_SESSION["login_token"]) && $_SESSION["login_token"]) {
        echo '<a href="account.php">Account</a>';
        echo '<a href="user/logout.php">Logout</a>';
    } else {
      echo '<a href="login.php">Sign In</a> <span>/</span> <a href="register.php">Sign Up</a>';
    }
  ?>
</div>
