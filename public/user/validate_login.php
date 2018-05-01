<?php

  session_start();

  // check $_POST variables against database

  if(isset($_POST["email"]) && isset($_POST["password"])) {
    require_once '../includes/database.php';

    validateLogin($_POST["email"], $_POST["password"]);

    if(!validateLogin($_POST["email"], $_POST["password"])) {
      $_SESSION["login_token"] = false;
      $_SESSION["email"] = false;
      $_SESSION["user"] = false;
      header("Location: ../login.php?login=failed");
    } else {
      $_SESSION["login_token"] = true;
      $_SESSION["email"] = $_POST["email"];
      $_SESSION["user"] = getUserSession($_POST["email"]);
      header("Location: ../index.php");
    }

  }


?>
