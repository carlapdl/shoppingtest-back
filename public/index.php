<?php
// src/index.php
require_once __DIR__ . '/../vendor/autoload.php';
//die("1. Autoload loaded.");

use FastRoute\Dispatcher;
use FastRoute\RouteCollector;
use FastRoute\simpleDispatcher;
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

$dbConfig = [
    'host'     => getenv('MYSQL_DB_HOST'), 
    'dbname'   => getenv('MYSQL_DATABASE'),
    'user'     => getenv('MYSQL_USER'),
    'password' => getenv('MYSQL_PASSWORD'),
    'port'     => getenv('MYSQL_PORT'),
    'charset'  => getenv('MYSQL_CHARSET')
];
//$dispatcher = FastRoute\simpleDispatcher(function(FastRoute\RouteCollector $r) {
$dispatcher = FastRoute\simpleDispatcher(function(FastRoute\RouteCollector $r) use($dbConfig) {
    //$r->post('/graphql', [App\Controller\GraphQL::class, 'handle']);
    //$r->post('/graphql', [GraphQL::class, 'handle']);
    $r->addRoute('POST', '/graphql', function() use ($dbConfig) { // <--- IMPORTANT: use ($dbConfig)
        $controller = new GraphQL($dbConfig); // Pass config to constructor
        $controller->handle(); // Call the handle method on the instance
    });

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
        /*
        $handler = $routeInfo[1];
        $vars = $routeInfo[2];
        echo $handler($vars);
        break;
        */
        
        $handler = $routeInfo[1]; // This will be [App\Controller\GraphQL::class, 'handle']
        $vars = $routeInfo[2];

        // --- THE FIX IS HERE ---
        if (is_callable($handler)) {
            // Call the handler closure directly.
            // The closure itself is responsible for instantiating the controller
            // and calling its method.
            // If the handler needs $vars, it must accept them as arguments.
            // In our case, GraphQL::handle() accepts $vars, so we pass them.
            $handler($vars);
        } else {
            // This else block should ideally not be hit if routes are correctly defined
            http_response_code(500);
            echo json_encode(['error' => 'Invalid route handler configuration.']);
        }
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