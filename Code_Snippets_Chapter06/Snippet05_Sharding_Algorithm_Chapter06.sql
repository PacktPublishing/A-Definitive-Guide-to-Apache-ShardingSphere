-- 1. Create Sharding Algorithms
CREATE SHARDING ALGORITHM shardingAlgorithmDefinition [,  shardingAlgorithmDefinition] ...

-- 2. Modify Sharding Algorithms
ALTER SHARDING ALGORITHM shardingAlgorithmDefinition [,  shardingAlgorithmDefinition] ...

shardingAlgorithmDefinition:
    shardingAlgorithmName(algorithmDefinition)

-- 3. Delete Sharding Algorithms
DROP SHARDING ALGORITHM algorithmName [, algorithmName] ...     

-- 4.Query Sharding Algorithms
SHOW SHARDING ALGORITHMS [FROM schemaName]
