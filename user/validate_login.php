<?php

  session_start();

  // check $_POST variables against database

  $_SESSION["login_token"] = true;

  // redirect home or to movies? depending on our storyboard
  header("Location: ../index.php");

?>
