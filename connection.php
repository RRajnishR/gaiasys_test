<?php 

$database = include('config.php');

$conn = new mysqli($database['host'], $database['user'], $database['pass'],$database['database']);

if (!$conn || $conn->connect_error) {
    die("Connection failed: " . mysqli_connect_error());
}

?>