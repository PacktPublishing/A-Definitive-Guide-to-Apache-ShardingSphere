-- 1. Create Binding Table Rules
CREATE SHARDING BINDING TABLE RULES (t_order, t_order_item);
-- 2. Modify Binding Table Rules
ALTER SHARDING BINDING TABLE RULES (t_order, t_order_item);
-- 3. Query Binding Table Rules
SHOW SHARDING BINDING TABLE RULES;
+-------------------------+
| sharding_binding_tables |
+-------------------------+
| t_order,t_order_item    |
+-------------------------+
-- 4. Delete the specified binding table rules
DROP SHARDING BINDING TABLE RULES (t_order, t_order_item);
