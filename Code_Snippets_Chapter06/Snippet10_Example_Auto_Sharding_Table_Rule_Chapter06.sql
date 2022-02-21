-- 1. Add Database Resources
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

-- 2. Create Auto Sharding Table Rules
CREATE SHARDING TABLE RULE t_order (
    RESOURCES(ds_0, ds_1),
    SHARDING_COLUMN=order_id, TYPE(NAME=hash_mod, PROPERTIES("sharding-count"=4)),
    GENERATED_KEY(COLUMN=another_id, TYPE(NAME=snowflake, PROPERTIES("worker-id"=123)))
);

-- 3. Add Database Resources
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

-- 4. Modify Auto Sharding Table Rules
ALTER SHARDING TABLE RULE t_order (
    RESOURCES(ds_0, ds_1, ds_2, ds_3),
    SHARDING_COLUMN=order_id, TYPE(NAME=hash_mod, PROPERTIES("sharding-count"=16)),
    GENERATED_KEY(COLUMN=another_id, TYPE(NAME=snowflake, PROPERTIES("worker-id"=123)))
);

-- 5. Query Auto Sharding Table Rules
SHOW SHARDING TABLE t_order;
+---------+-------------------+---------------------+------------------------+--------------------------+----------------------------------+-----------------------------------+---------------------+-----------------------+-------------------------------+--------------------------------+---------------------+--------------------+---------------------+
| table   | actual_data_nodes | actual_data_sources | database_strategy_type | database_sharding_column | database_sharding_algorithm_type | database_sharding_algorithm_props | table_strategy_type | table_sharding_column | table_sharding_algorithm_type | table_sharding_algorithm_props | key_generate_column | key_generator_type | key_generator_props |
+---------+-------------------+---------------------+------------------------+--------------------------+----------------------------------+-----------------------------------+---------------------+-----------------------+-------------------------------+--------------------------------+---------------------+--------------------+---------------------+
| t_order |                   | ds_0,ds_1,ds_2,ds_3 |                        |                          |                                  |                                   | hash_mod            | order_id              | hash_mod                      | sharding-count=16              | another_id          | snowflake          | worker-id=123       |
+---------+-------------------+---------------------+------------------------+--------------------------+----------------------------------+-----------------------------------+---------------------+-----------------------+-------------------------------+--------------------------------+---------------------+--------------------+---------------------+

-- 6. Delete Auto Sharding Table Rules
DROP SHARDING TABLE RULE t_order;
