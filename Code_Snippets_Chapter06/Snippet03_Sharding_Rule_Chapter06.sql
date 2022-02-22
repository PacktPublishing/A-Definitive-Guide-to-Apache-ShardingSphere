-- 1.Create Sharding Table Rules
CREATE SHARDING TABLE RULE shardingTableRuleDefinition [, shardingTableRuleDefinition] ...

-- 2.Modify Sharding Table Rules
ALTER SHARDING TABLE RULE shardingTableRuleDefinition [, shardingTableRuleDefinition] ...

shardingTableRuleDefinition:
    shardingAutoTableRule | shardingTableRule
   
shardingAutoTableRule:
    tableName(resources COMMA shardingColumn COMMA algorithmDefinition (COMMA keyGenerateDeclaration)?)
    
shardingTableRule:
    tableName(dataNodes (COMMA  databaseStrategy)? (COMMA tableStrategy)? (COMMA keyGenerateDeclaration)?)

resources:
    RESOURCES(resource [, resource] ...)

dataNodes:
    DATANODES(dataNode [, dataNode] ...)
resource:
    resourceName | inlineExpression

dataNode:
    resourceName | inlineExpression

shardingColumn:
    SHARDING_COLUMN=columnName

algorithmDefinition:
    TYPE(NAME=shardingAlgorithmType [, PROPERTIES([algorithmProperties])])

keyGenerateDeclaration:
    keyGenerateDefinition | keyGenerateConstruction

keyGenerateDefinition:
    GENERATED_KEY(COLUMN=columnName, strategyDefinition)

keyGenerateConstruction
    GENERATED_KEY(COLUMN=columnName, GENERATED_KEY_ALGORITHM=keyGenerateAlgorithmName)
    
databaseStrategy:
    DATABASE_STRATEGY(shardingStrategy)

tableStrategy:
    TABLE_STRATEGY(shardingStrategy)

strategyDefinition:
    TYPE(NAME=keyGenerateStrategyType [, PROPERTIES([algorithmProperties])])

algorithmProperties:
    algorithmProperty [, algorithmProperty] ...

algorithmProperty:
    key=value 

-- 3. Delete Sharding Table Rules
DROP SHARDING TABLE RULE tableName [, tableName] ...
-- 4. Query Sharding Table Rules
SHOW SHARDING TABLE tableRule | RULES [FROM schemaName]

tableRule:
    RULE tableName
