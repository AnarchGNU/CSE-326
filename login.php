<?php
  session_start();

  // Redirect home if already logged in
  if(isset($_SESSION["login_token"]) && $_SESSION["login_token"]) {
    header("Location: index.php");
  }
?>
<!DOCTYPE html>
<html lang="en">

  <head>
    <?php require_once 'includes/head.php'; ?>

    <!-- Title -->
    <title>PyFlicks - Login</title>
  </head>

  <body>

    <header>
      <?php require_once 'includes/header.php'; ?>
    </header>

    <main>

      <form action="user/validate_login.php" method="post" class="form">
        <h2>Login</h2>
        <input type="email" name="email" placeholder="Email"><br>
        <input type="password" name="password" placeholder="•••••••••"><br>
        <input type="submit" style="visibility: hidden">
      </form>


    </main>

    <footer>
      <?php require_once 'includes/footer.php'; ?>
    </footer>

  </body>
</html>
