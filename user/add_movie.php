<?php


  session_start();

  print_r($_SESSION);
  print_r($_GET);

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

  print_r($_SESSION);

  userAddMovie($email, $id);

  echo "1";


?>
