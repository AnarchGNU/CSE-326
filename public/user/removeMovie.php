<?php

  session_start();

  if(!isset($_SESSION["login_token"]) || !$_SESSION["login_token"]) {
    echo "0";
    exit();
  }

  if(!isset($_GET["id"]) || !isset($_SESSION["email"])) {
    echo "0";
    exit();
  }

  require_once '../includes/database.php';

  $email = $_SESSION["email"];
  $id = $_GET["id"];

  userRemoveMovie($email, $id);
  $_SESSION["user"] = getUserSession($email);

  echo "1";


?>
