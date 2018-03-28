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
    <title>PyFlicks - Register</title>
  </head>

  <body>

    <header>
      <?php require_once 'includes/header.php'; ?>
    </header>

    <main>

      <form action="user/create_user.php" method="post" class="form">
        <h2>Sign Up</h2>
        <input type="email" name="email" placeholder="Email"><br>
        <input type="text" name="first_name" placeholder="First Name"><br>
        <input type="text" name="last_name" placeholder="Last Name"><br>
        <input type="password" name="password" placeholder="Password"><br>
        <input type="password" name="password_confirm" placeholder="Confirm Password"><br>
        <input type="submit" style="visibility: hidden"><br>

        <?php

          if(isset($_GET["error"])) {
            $error = $_GET["error"];
            if($error === "email")
              echo '<div class="error"><p>Invalid email.</p></div>';
            else if($error === "first")
              echo '<div class="error"><p>Invalid First Name.</p></div>';
            else if($error === "last")
              echo '<div class="error"><p>Invalid Last Name.</p></div>';
            else if($error === "password")
              echo '<div class="error"><p>Invalid password.</p></div>';
            else if($error === "match")
              echo '<div class="error"><p>Passwords did not match.</p></div>';
            else if($error === "exists")
              echo '<div class="error"><p>This email is already in use.</p></div>';
            else
              echo '<div class="error"><p>An error occured. Try again.</p></div>';
          }

        ?>
      </form>


    </main>

    <footer>
      <?php require_once 'includes/footer.php'; ?>
    </footer>

  </body>
</html>
