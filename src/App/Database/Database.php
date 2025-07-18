<?php

namespace App\Database;

use PDO;
use PDOException;

/**
 * Database class for managing MySQL connections using PDO.
 * Provides methods for connecting, executing queries, and handling transactions.
 */
class Database
{
    private ?PDO $pdo = null; // Nullable PDO instance
    private array $config;    // Database configuration array

    /**
     * Constructor for the Database class.
     *
     * @param array $config An associative array containing database connection details:
     * [
     * 'host'     => 'localhost',
     * 'port'     => '3306', // Optional, defaults to 3306
     * 'dbname'   => 'your_database',
     * 'user'     => 'your_user',
     * 'password' => 'your_password',
     * 'charset'  => 'utf8mb4' // Optional, defaults to utf8mb4
     * ]
     */
    public function __construct(array $config)
    {
        //echo 'hello db constructor';
        $this->config = $config;
    }

    /**
     * Establishes a PDO connection to the database.
     *
     * @return PDO The PDO connection object.
     * @throws PDOException If the connection fails.
     */
    public function connect(): PDO
    {
        //echo "db connect";
        if ($this->pdo === null) {
            $host = $this->config['host'];
            $port = $this->config['port'];
            $dbname = $this->config['dbname'];
            $user = $this->config['user'];
            $password = $this->config['password'];
            $charset = 'utf8mb4';

            $dsn = "mysql:host={$host};port={$port};dbname={$dbname};charset={$charset}";
            $options = [
                PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Throw exceptions on errors
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,       // Fetch results as associative arrays
                PDO::ATTR_EMULATE_PREPARES   => false,                  // Disable emulation for better security and performance
            ];

            try {
                $this->pdo = new PDO($dsn, $user, $password, $options);
            } catch (PDOException $e) {
                // Log the error (e.g., to file, Sentry, etc.)
                error_log("Database connection failed: " . $e->getMessage());
                // Re-throw or throw a custom exception for the application to handle
                throw new PDOException("Could not connect to the database. Please check configuration.", 0, $e);
            }
        }
        return $this->pdo;
    }

    /**
     * Executes a prepared SQL query.
     *
     * @param string $sql The SQL query string.
     * @param array $params An associative array of parameters for the prepared statement (e.g., ['id' => 1]).
     * @return array An array of fetched rows.
     * @throws PDOException If the query execution fails.
     */
    public function query(string $sql, array $params = []): array
    {
        //echo 'db query';
        $stmt = $this->connect()->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll();
    }

    /**
     * Executes a prepared SQL query and fetches a single row.
     *
     * @param string $sql The SQL query string.
     * @param array $params An associative array of parameters.
     * @return array|false An associative array representing the row, or false if no row is found.
     * @throws PDOException If the query execution fails.
     */
    public function fetch(string $sql, array $params = []): array|false
    {
        $stmt = $this->connect()->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetch();
    }

    /**
     * Executes an INSERT, UPDATE, or DELETE query.
     *
     * @param string $sql The SQL query string.
     * @param array $params An associative array of parameters.
     * @return int The number of affected rows.
     * @throws PDOException If the query execution fails.
     */
    public function execute(string $sql, array $params = []): int
    {
        $stmt = $this->connect()->prepare($sql);
        $stmt->execute($params);
        return $stmt->rowCount();
    }

    /**
     * Begins a transaction.
     *
     * @return bool True on success, false on failure.
     */
    public function beginTransaction(): bool
    {
        return $this->connect()->beginTransaction();
    }

    /**
     * Commits a transaction.
     *
     * @return bool True on success, false on failure.
     */
    public function commit(): bool
    {
        return $this->connect()->commit();
    }

    /**
     * Rolls back a transaction.
     *
     * @return bool True on success, false on failure.
     */
    public function rollBack(): bool
    {
        return $this->connect()->rollBack();
    }

    /**
     * Returns the last inserted ID.
     *
     * @param string|null $name The name of the sequence object from which the ID should be returned.
     * @return string The ID of the last inserted row.
     */
    public function lastInsertId(?string $name = null): string
    {
        return $this->connect()->lastInsertId($name);
    }
}