<?php
$host = 'dnd-db2.cri8cm2i269q.us-east-2.rds.amazonaws.com';
$db   = 'dnddb';
$user = 'admin';
$pass = 'passwordfordnddb';

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $race_id = (int)$_POST['race_id'];
    $class_id = (int)$_POST['class_id'];
    $subclass_id = (int)$_POST['subclass_id'];

    if ($race_id > 0 && $class_id > 0 && $subclass_id > 0) {
        
        $sql = "INSERT INTO character_submissions (race_id, class_id, subclass_id) 
                VALUES ($race_id, $class_id, $subclass_id)";

        if ($conn->query($sql) === TRUE) {
            echo "<h2>Success!</h2>";
            echo "<p>Character saved to database. <a href='index.html'>Log another?</a></p>";
        } else {
            echo "Error inserting record: " . $conn->error;
        }
    } else {
        echo "Error: Missing form data. Please fill out all fields.";
    }
}

// Close the connection
$conn->close();
?>