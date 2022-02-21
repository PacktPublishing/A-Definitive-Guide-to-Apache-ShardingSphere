-- 1.Add Database Resources
ADD RESOURCE ds_0 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=ds_0,
     USER=root,
     PASSWORD=123456
);
ADD RESOURCE ds_1 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=ds_1,
     USER=root,
     PASSWORD=123456
);
ADD RESOURCE ds_2 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=ds_2,
     USER=root,
     PASSWORD=123456
);
ADD RESOURCE ds_3 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=ds_3,
     USER=root,
     PASSWORD=123456
);

-- 2. Create Sharding Rules
-- 2.1. Create the distributed key generator named snowflake
CREATE SHARDING KEY GENERATOR snowflake (
     TYPE(NAME=SNOWFLAKE, PROPERTIES("worker-id"=123))
);

-- 2.2. Create the sharding algorithm database_inline
CREATE SHARDING ALGORITHM database_inline (
     TYPE(NAME=inline,PROPERTIES("algorithm-expression"="ds_${user_id % 2}"))
);

-- 2.3. Create the sharding algorithm table_inline
CREATE SHARDING ALGORITHM table_inline (
     TYPE(NAME=inline, PROPERTIES("algorithm-expression"="t_order_item_${order_id % 2}"))
);

-- 2.4. Create default sharding strategies
CREATE DEFAULT SHARDING DATABASE STRATEGY (
     TYPE = standard, SHARDING_COLUMN=order_id, SHARDING_ALGORITHM=database_inline
);

-- 2.5. Create the sharding table rule t_order_item
CREATE SHARDING TABLE RULE t_order_item (
     DATANODES("ds_${0..1}.t_order_item_${0..1}"),
     DATABASE_STRATEGY(TYPE=standard, SHARDING_COLUMN=user_id, SHARDING_ALGORITHM=database_inline),
     TABLE_STRATEGY(TYPE=standard, SHARDING_COLUMN=order_id, SHARDING_ALGORITHM=table_inline),
     GENERATED_KEY(COLUMN=another_id, GENERATED_KEY_ALGORITHM=snowflake)
);

-- 3. Modify Sharding Rules
-- 3.1.Modify the distributed key generator snowflake
ALTER SHARDING KEY GENERATOR snowflake (
     TYPE(NAME=SNOWFLAKE, PROPERTIES("worker-id"=456))
);

-- 3.2. Modify the sharding algorithm database_inline
ALTER SHARDING ALGORITHM database_inline (
     TYPE(NAME=inline,PROPERTIES("algorithm-expression"="ds_${user_id % 4}"))
);

-- 3.3. Modify the sharding algorithm table_inline
ALTER SHARDING ALGORITHM table_inline (
     TYPE(NAME=inline,PROPERTIES("algorithm-expression"="t_order_item_${order_id % 4}"))
);

-- 3.4. Modify Default Sharding Strategies
ALTER DEFAULT SHARDING DATABASE STRATEGY (
     TYPE = standard, SHARDING_COLUMN=user_id, SHARDING_ALGORITHM=database_inline
);

-- 3.5. Modify the sharding rule t_order_item 
ALTER SHARDING TABLE RULE t_order_item (
     DATANODES("ds_${0..3}.t_order_item${0..3}"),
     DATABASE_STRATEGY(TYPE=standard, SHARDING_COLUMN=user_id, SHARDING_ALGORITHM=database_inline),
     TABLE_STRATEGY(TYPE=standard, SHARDING_COLUMN=order_id, SHARDING_ALGORITHM=table_inline),
     GENERATED_KEY(COLUMN=another_id, GENERATED_KEY_ALGORITHM=snowflake)
);

-- 4. Query Sharding Rules
-- 4.1.Query Distributed Key Generators
SHOW SHARDING KEY GENERATORS;
+-------------------+-----------+-----------------+
| name              | type      | props           |
+-------------------+-----------+-----------------+
| t_order_snowflake | snowflake | {worker-id=123} |
| snowflake         | SNOWFLAKE | {worker-id=123} |
+-------------------+-----------+-----------------+
-- 4.2. Query Sharding Algorithms
SHOW SHARDING ALGORITHMS;
+------------------+----------+---------------------------------------------------+
| name             | type     | props                                             |
+------------------+----------+---------------------------------------------------+
| t_order_hash_mod | hash_mod | sharding-count=16                                 |
| database_inline  | inline   | algorithm-expression=ds_${user_id % 4}            |
| table_inline     | inline   | algorithm-expression=t_order_item_${order_id % 4} |
+------------------+----------+---------------------------------------------------+
-- 4.3. Query Default Sharding Strategies
SHOW DEFAULT SHARDING STRATEGY;
+----------+----------+-----------------+-------------------------+-------------------------+------------------------------------------+
| name     | type     | sharding_column | sharding_algorithm_name | sharding_algorithm_type | sharding_algorithm_props                 |
+----------+----------+-----------------+-------------------------+-------------------------+------------------------------------------+
| TABLE    | NONE     |                 |                         |                         |                                          |
| DATABASE | STANDARD | user_id         | database_inline         | inline                  | {algorithm-expression=ds_${user_id % 4}} |
+----------+----------+-----------------+-------------------------+-------------------------+------------------------------------------+
-- 4.4.Query the sharding rule t_order_item
SHOW SHARDING TABLE RULE t_order_item;
+--------------+--------------------------------+---------------------+------------------------+--------------------------+----------------------------------+----------------------------------------+---------------------+-----------------------+-------------------------------+---------------------------------------------------+---------------------+--------------------+---------------------+
| table        | actual_data_nodes              | actual_data_sources | database_strategy_type | database_sharding_column | database_sharding_algorithm_type | database_sharding_algorithm_props      | table_strategy_type | table_sharding_column | table_sharding_algorithm_type | table_sharding_algorithm_props                    | key_generate_column | key_generator_type | key_generator_props |
+--------------+--------------------------------+---------------------+------------------------+--------------------------+----------------------------------+----------------------------------------+---------------------+-----------------------+-------------------------------+---------------------------------------------------+---------------------+--------------------+---------------------+
| t_order_item | ds_${0..3}.t_order_item${0..3} |                     | inline                 | user_id                  | inline                           | algorithm-expression=ds_${user_id % 4} | inline              | order_id              | inline                        | algorithm-expression=t_order_item_${order_id % 4} | another_id          | SNOWFLAKE          | worker-id=123       |
+--------------+--------------------------------+---------------------+------------------------+--------------------------+----------------------------------+----------------------------------------+---------------------+-----------------------+-------------------------------+---------------------------------------------------+---------------------+--------------------+---------------------+

-- 5. Delete Sharding Rules
-- 5.1. Delete Distributed Key Generators
DROP SHARDING KEY GENERATOR snowflake;
-- 5.2. Delete the sharding algorithm database_inline
DROP SHARDING ALGORITHM database_inline;
-- 5.3. Delete the sharding algorithm table_inline
DROP SHARDING ALGORITHM table_inline;
-- 5.4. Delete Default Sharding Strategies
DROP DEFAULT SHARDING DATABASE STRATEGY;
-- 5.5. Delete the sharding rule t_order_item
DROP SHARDING TABLE RULE t_order_item;
