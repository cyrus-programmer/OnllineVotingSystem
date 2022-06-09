<?php
include "config.php";
include "main.php";
if (!$conn) {
    echo json_encode("Connection Failed");
}
if ($_POST["service"] == "Party Details") {
    $obj = new DBServices();
    $obj->getPartyDetails($conn);
} else if ($_POST["service"] == "Login Check") {
    $obj = new DBServices();
    $obj->loginCheck($conn, $_POST["cnic"], $_POST["password"]);
} else if ($_POST["service"] == "Voted") {
    $obj = new DBServices();
    $obj->vote($conn, $_POST["cnic"], $_POST["party_id"]);
} else if ($_POST["service"] == "Register") {
    $obj = new DBServices();
    $obj->register($conn, $_POST["cnic"], $_POST["password"]);
} else if ($_POST["service"] == "Person Details") {
    $obj = new DBServices();
    $obj->getPersonDetails($conn, $_POST["cnic"]);
} else if ($_POST["service"] == "Result Check") {
    $obj = new DBServices();
    $obj->checkResult($conn);
} else if ($_POST["service"] == "Calculate MNA") {
    $obj = new DBServices();
    $obj->calculateMNA($conn, $_POST["district"]);
} else if ($_POST["service"] == "Add MNA") {
    $obj = new DBServices();
    $obj->addMNA($conn,$_POST["Party"], $_POST["District"], $_POST["MNA"]);
} else if ($_POST["service"] == "Calculate Districts") {
    $obj = new DBServices();
    $obj->calculateDistricts($conn);
} else if ($_POST["service"] == "Calculate Provinces") {
    $obj = new DBServices();
    $obj->calculateProvinces($conn);
} else if ($_POST["service"] == "Calculate Leading Party") {
    $obj = new DBServices();
    $obj->calculateProvinces($conn);
} else if ($_POST["service"] == "Add Party") {
    $obj = new DBServices();
    $obj->addPartyLead($conn, $_POST["province"], $_POST["party"]);
} else if ($_POST["service"] == "Winner Party") {
    $obj = new DBServices();
    $obj->calculateLeader($conn);
}

