<?php

  session_start();
  $_SESSION["login_token"] = false;
  $_SESSION["email"] = false;
  header("Location: ../index.php");

?>
