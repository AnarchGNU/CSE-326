<?php

  session_start();

  if(!isset($_SESSION["login_token"]) || !$_SESSION["login_token"]) {
    echo "0";
    exit();
  }

  if(!isset($_POST["score"]) || !$_POST["score"]) {
    echo "You didn't submit a valid form!";
    exit();
  }


  require_once '../includes/database.php';
  $email = $_SESSION["email"];
  $id = $_POST["id"];
  $score = $_POST["score"];

  userRateMovie($email, $id, $score);
  watchRemoveMovie($email, $id);
  $_SESSION["user"] = getUserSession($email);

  header("Location: ../account.php");


?>
