<?php

namespace App\Controller;

use GraphQL\Error\DebugFlag;
use GraphQL\GraphQL as GraphQLBase;
use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use GraphQL\Type\Schema;
use GraphQL\Type\SchemaConfig;
use App\Database\Database;
use RuntimeException;
use Throwable;
use PDOException;

class GraphQL {
    private Database $db;

    public function __construct(array $config){
        // Initialize the Database connection
        $this->db = new Database($config);
    }

    public function handle() {
        $databaseInstance = $this->db; 
        try {
            $queryType = new ObjectType([
                'name' => 'Query',
                'fields' => [
                    'echo' => [
                        'type' => Type::string(),
                        'args' => [
                            'message' => ['type' => Type::string()],
                        ],
                        'resolve' => static fn ($rootValue, array $args): string => $rootValue['prefix'] . $args['message'],
                    ],
                    'categories' => [
                        'type' => Type::listOf(Type::string()),
                        'description' => 'List of item categories',
                        'resolve' => function () use($databaseInstance)  {
                            //echo "here";
                            //$categories = Database::query('SELECT name FROM categories');
                            //$categories = $this->db->query('SELECT name FROM categories');
                            //return array_column($categories, 'name');
                            //var_dump($this->db);
                            //$categories = $databaseInstance->query('SELECT name FROM categories');
                            //return array_column($categories, 'name');
                            //var_dump($categories);
                            
                            try {
                                // Access the database instance via $this->db
                                //$categories = $this->db->query('SELECT name FROM categories');
                                $categories = $databaseInstance->query('SELECT name FROM categories');
                                return array_column($categories, 'name'); // Extract 'name' column
                                //var_dump($categories);
                            } catch (PDOException $e) {
                                // Handle database errors gracefully in GraphQL
                                throw new \GraphQL\Error\UserError("Database error fetching categories: " . $e->getMessage());
                            }
                              
                        }
                    ]
                ],
            ]);
        
            $mutationType = new ObjectType([
                'name' => 'Mutation',
                'fields' => [
                    'sum' => [
                        'type' => Type::int(),
                        'args' => [
                            'x' => ['type' => Type::int()],
                            'y' => ['type' => Type::int()],
                        ],
                        'resolve' => static fn ($calc, array $args): int => $args['x'] + $args['y'],
                    ],
                ],
            ]);
        
            // See docs on schema options:
            // https://webonyx.github.io/graphql-php/schema-definition/#configuration-options
            $schema = new Schema(
                (new SchemaConfig())
                ->setQuery($queryType)
                ->setMutation($mutationType)
            );
        
            
            $rawInput = file_get_contents('php://input');
            if ($rawInput === false) {
                throw new RuntimeException('Failed to get php://input');
            }
        
            $input = json_decode($rawInput, true);
            $query = $input['query'];
            $variableValues = $input['variables'] ?? null;

            $rootValue = ['prefix' => 'You said: '];
            $result = GraphQLBase::executeQuery($schema, $query, $rootValue, null, $variableValues);
            $output = $result->toArray();
        } catch (Throwable $e) {
            $output = [
                'error' => [
                    'message' => $e->getMessage(),
                ],
            ];
        }

        header('Content-Type: application/json; charset=UTF-8');
        echo json_encode($output);
        //return json_encode($output);
    }
}