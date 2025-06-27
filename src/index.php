<?php
// src/index.php

echo "<h1>Hello from PHP and Apache!</h1>";


// --- Database Connection Test ---
//$servername='dbmysql';
$servername = getenv('MYSQL_DB_HOST'); // This is the service name defined in docker-compose.yml
$username = getenv('MYSQL_USER'); // Retrieved from environment variables set in docker-compose.yml
$password = getenv('MYSQL_PASSWORD');
$dbname = getenv('MYSQL_DATABASE');


$conn = null;
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // Set the PDO error mode to exception for better error handling
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "<p>Successfully connected to MySQL database: <strong>" . htmlspecialchars($dbname) . "</strong></p>";
} catch(PDOException $e) {
    echo "<p style='color: red;'>Connection failed: " . htmlspecialchars($e->getMessage()) . "</p>";
    echo "<p>Please ensure your MySQL service is running and credentials in your <code>.env</code> file are correct and match the <code>docker-compose.yml</code>.</p>";
} finally {
    if ($conn) {
        $conn = null; // Close connection
    }
}

// Optional: Display PHP info for detailed configuration (remove in production)
// phpinfo();

?>