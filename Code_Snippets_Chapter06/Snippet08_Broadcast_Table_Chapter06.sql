-- 1. Create Broadcast Table Rules
CREATE SHARDING BROADCAST TABLE RULES (tableName [, tableName] ...)

-- 2. Modify Broadcast Table Rules
ALTER SHARDING BROADCAST TABLE RULES (tableName [, tableName] ...)

-- 3. Delete Broadcast Table Rules
DROP SHARDING BROADCAST TABLE RULES (tableName [, tableName] ...)

-- 4. Query Broadcast Table Rules
SHOW SHARDING BROADCAST TABLE RULES [FROM schemaName] 
