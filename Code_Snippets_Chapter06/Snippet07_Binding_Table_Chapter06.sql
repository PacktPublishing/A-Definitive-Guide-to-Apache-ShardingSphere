-- 1. Create Binding Table Rules
CREATE SHARDING BINDING TABLE RULES bindTableRulesDefinition [, bindTableRulesDefinition] ...

-- 2. Modify Binding Table Rules
ALTER SHARDING BINDING TABLE RULES bindTableRulesDefinition [, bindTableRulesDefinition] ...

-- 3. Delete Binding Table Rules
DROP SHARDING BINDING TABLE RULES bindTableRulesDefinition [, bindTableRulesDefinition] ...

bindTableRulesDefinition:
    (tableName [, tableName] ... )
    
-- 4. Query Binding Table Rules
SHOW SHARDING BINDING TABLE RULES [FROM schemaName] 
