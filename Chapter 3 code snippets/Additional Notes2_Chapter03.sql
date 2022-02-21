> SHOW SHARDING TABLE RULES;


mysql> show sharding table rules;
+---------+---------------------+---------------------+-----------------------+-------------------------------+--------------------------------+
| table   | actual_data_sources | table_strategy_type | table_sharding_column | table_sharding_algorithm_type | table_sharding_algorithm_props |
+---------+---------------------+---------------------+-----------------------+-------------------------------+--------------------------------+
| t_order | ds_0                | hash_mod            | order_id              | hash_mod                      | sharding-count=4               |
+---------+---------------------+---------------------+-----------------------+-------------------------------+--------------------------------+
1 row in set (0.01 sec)
