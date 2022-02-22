-- 1. Create Sharding Strategies
CREATE DEFAULT SHARDING shardingScope STRATEGY (shardingStrategy)
-- 2.Modify Sharding Strategies
ALTER DEFAULT SHARDING shardingScope STRATEGY (shardingStrategy)
-- 3.Delete Sharding Strategies
DROP DEFAULT SHARDING shardingScope STRATEGY;

shardingScope:
    DATABASE | TABLE

shardingStrategy:
    TYPE=strategyType, shardingColumn, shardingAlgorithm

shardingAlgorithm:
    existingAlgorithm | autoCreativeAlgorithm

existingAlgorithm:
    SHARDING_ALGORITHM=shardingAlgorithmName

autoCreativeAlgorithm:
    SHARDING_ALGORITHM(algorithmDefinition)

-- 4.Query Default Sharding Strategies
SHOW DEFAULT SHARDING STRATEGY
