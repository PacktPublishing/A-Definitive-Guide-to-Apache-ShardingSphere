-- 1. Create Broadcast Table Rules
CREATE SHARDING BROADCAST TABLE RULES (t_config);
-- 2. Delete Broadcast Table Rules
ALTER SHARDING BROADCAST TABLE RULES (t_config);
-- 3. Query Broadcast Table Rules
SHOW SHARDING BROADCAST TABLE RULES;
+---------------------------+
| sharding_broadcast_tables |
+---------------------------+
| t_config                  |
+---------------------------+
-- 4. Delete Broadcast Table Rules
DROP SHARDING BROADCAST TABLE RULES t_config;
