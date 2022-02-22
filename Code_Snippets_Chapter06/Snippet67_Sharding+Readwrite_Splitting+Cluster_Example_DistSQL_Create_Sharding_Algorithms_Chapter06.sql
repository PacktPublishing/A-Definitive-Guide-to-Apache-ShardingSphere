CREATE SHARDING ALGORITHM database_inline (
     TYPE(NAME=inline, PROPERTIES("algorithm-expression"="ds_${user_id % 2}"))
), t_order_inline (
     TYPE(NAME=inline, PROPERTIES("algorithm-expression"="t_order_${order_id % 2}"))
), t_order_item_inline (
     TYPE(NAME=inline, PROPERTIES("algorithm-expression"="t_order_item_${order_id % 2}"))
);
