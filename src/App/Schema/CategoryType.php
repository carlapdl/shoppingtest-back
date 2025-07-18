<?php

namespace App\Schema;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

/**
 * Defines the GraphQL Category type.
 * Represents a single category object with its fields.
 */
class CategoryType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Category', // The name of this GraphQL type
            'description' => 'Products Category',
            'fields' => [
                'id' => [ // Assuming you will add an 'id' column to your categories table
                    'type' => Type::int(), // Or Type::string() if your ID is a string (e.g., UUID)
                    'description' => 'categories.id',
                    // No resolve function needed if 'id' directly maps to a key in the returned array/object
                ],
                'name' => [
                    'type' => Type::nonNull(Type::string()), // Category name is required and a string
                    'description' => 'category name (e.g., "clothes", "tech").',
                    // No resolve function needed if 'name' directly maps to a key in the returned array/object
                ],
                // Add '__typename' here if your frontend specifically queries it,
                // but it's often added automatically by clients like Apollo.
                // 'typename' => [
                //     'type' => Type::string(),
                //     'resolve' => fn() => 'Category'
                // ]
            ]
        ]);
    }
}