-- 1. Create Sharding Key Generators
CREATE SHARDING KEY GENERATOR keyGeneratorDefinition [, keyGeneratorDefinition] ...

-- 2. Modify Sharding Key Generators
ALTER SHARDING KEY GENERATOR keyGeneratorDefinition [, keyGeneratorDefinition] ...

-- 3. Delete Sharding Key Generators
DROP SHARDING KEY GENERATOR keyGeneratorName [, keyGeneratorName] ...

-- 4. Query Sharding Key Generators
SHOW SHARDING KEY GENERATORS [FROM schemaName]
