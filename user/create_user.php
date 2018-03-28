<?php

  session_start();

  // check $_POST variables against database

  if(!isset($_POST["email"]) || empty($_POST["email"])) {
    header("Location: ../register.php?error=email");
    exit();
  }

  if(!isset($_POST["first_name"]) || empty($_POST["first_name"])) {
    header("Location: ../register.php?error=first");
    exit();
  }

  if(!isset($_POST["last_name"]) || empty($_POST["last_name"])) {
    header("Location: ../register.php?error=last");
    exit();
  }

  if(!isset($_POST["password"]) ||  empty($_POST["password"])) {
    header("Location: ../register.php?error=password");
    exit();
  }

  if(!isset($_POST["password_confirm"]) || empty($_POST["password_confirm"]) || $_POST["password"] != $_POST["password_confirm"]) {
    header("Location: ../register.php?error=match");
    exit();
  }

  // No problems, check that email is not already registered
  require_once '../includes/database.php';

  if(userExists($_POST["email"])) {
    header("Location: ../register.php?error=exists");
    exit();
  }

  // Email is not in use, create their account
  if(createUserAccount($_POST["email"], $_POST["first_name"], $_POST["last_name"], $_POST["password"])) {
    $_SESSION["login_token"] = true;
    $_SESSION["email"] = $_POST["email"];
    header("Location: ../account.php");
    exit();
  } else {
    header("Location: ../register.php?error=failed");
    exit();
  }




?>
