-- 1. Create Default Single Table Rules
CREATE DEFAULT SINGLE TABLE RULE singleTableRuleDefinition

-- 2. Modify Default Single Table Rules
ALTER DEFAULT SINGLE TABLE RULE singleTableRuleDefinition

-- 3. Delete Default Single Table Rules
DROP DEFAULT SINGLE TABLE RULE

singleTableRuleDefinition:
    RESOURCE = resourceName
    
-- 4. Query Default Single Table Rules
SHOW SINGLE TABLE (tableRule | RULES) [FROM schemaName]
SHOW SINGLE TABLES 

tableRule:
    RULE tableName
