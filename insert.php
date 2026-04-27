<?php
// Replace these with your actual AWS RDS credentials
$host = 'your-rds-endpoint.amazonaws.com';
$db   = 'your_database_name';
$user = 'your_username';
$pass = 'your_password';

// Create connection
$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_error) {
    die("Database Connection failed: " . $conn->connect_error);
}

// Check if form data is actually posted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // Capture the IDs from the HTML form and cast them as integers for security
    $race_id = (int)$_POST['race_id'];
    $class_id = (int)$_POST['class_id'];
    $subclass_id = (int)$_POST['subclass_id'];

    // Ensure no empty values are submitted
    if ($race_id > 0 && $class_id > 0 && $subclass_id > 0) {
        
        // Prepare the INSERT statement
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