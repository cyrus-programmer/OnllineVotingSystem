<?php
header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST');
    header("Access-Control-Allow-Headers: X-Requested-With");
    $db = "carparkingsystem"; //database name
    $dbuser = "root"; //database username
    $dbpassword = ""; //database password
    $dbhost = "localhost"; //database host
  
    $return["type"] = "";
    $return["success"] = false;
  
    $conn = new PDO("mysql:host=localhost;dbname=onlinevotingsystem", $dbuser, $dbpassword);
