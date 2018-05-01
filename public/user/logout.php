<?php

  session_start();
  $_SESSION["login_token"] = false;
  $_SESSION["email"] = false;
  $_SESSION["user"] = false;
  header("Location: ../index.php");

?>
