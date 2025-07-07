<?php
// src/index.php
require_once __DIR__ . '/../vendor/autoload.php';

use App\Controller\GraphQL as GraphQL;

//echo __DIR__;

// CORS Headers (Alternative/Fallback to Apache config, good for debugging)
//header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
header("Access-Control-Allow-Credentials: true");

// Handle OPTIONS requests (preflight) if Apache didn't catch them
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

$dispatcher = FastRoute\simpleDispatcher(function(FastRoute\RouteCollector $r) {
    $r->post('/graphql', [App\Controller\GraphQL::class, 'handle']);

    // Example of other routes
    $r->get('/', function() {
        echo "<h1>Welcome to your GraphQL API!</h1>";
        echo "<p>Send a POST request to <code>/graphql</code> with your GraphQL query.</p>";
        echo "<p>Example: <code>curl -X POST -H 'Content-Type: application/json' -d '{ \"query\": \"{ hello }\" }' http://localhost/graphql</code></p>";
    });
});

$routeInfo = $dispatcher->dispatch(
    $_SERVER['REQUEST_METHOD'],
    $_SERVER['REQUEST_URI']
);

//var_dump($routeInfo);

switch ($routeInfo[0]) {
    case FastRoute\Dispatcher::NOT_FOUND:
        // ... 404 Not Found
        break;
    case FastRoute\Dispatcher::METHOD_NOT_ALLOWED:
        $allowedMethods = $routeInfo[1];
        // ... 405 Method Not Allowed
        break;
    case FastRoute\Dispatcher::FOUND:
        $handler = $routeInfo[1];
        $vars = $routeInfo[2];
        echo $handler($vars);
        break;
}

//echo "<h1>Hello from PHP and Apache!</h1>";

/*
// --- Database Connection Test ---
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
*/
// Optional: Display PHP info for detailed configuration (remove in production)
// phpinfo();
?>