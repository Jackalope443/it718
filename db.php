<?php
$host = 'dnd-db2.cri8cm2i269q.us-east-2.rds.amazonaws.com';
$db   = 'dnddb';
$user = 'admin';
$pass = 'passwordfordnddb';

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>