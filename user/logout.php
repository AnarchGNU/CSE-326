<?php

  session_start();
  $_SESSION["login_token"] = false;
  header("Location: ../index.php");

?>
