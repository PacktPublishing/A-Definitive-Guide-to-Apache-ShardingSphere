CREATE SHARDING TABLE RULE t_order (
     DATANODES("ds_${0..1}.t_order_${0..1}"),
     TABLE_STRATEGY(TYPE=standard, SHARDING_COLUMN=order_id, SHARDING_ALGORITHM=t_order_inline),
     GENERATED_KEY(COLUMN= order_id, GENERATED_KEY_ALGORITHM=snowflake)
)，t_order_item (
     DATANODES("ds_${0..1}.t_order_item_${0..1}"),
     TABLE_STRATEGY(TYPE=standard, SHARDING_COLUMN=order_id, SHARDING_ALGORITHM=t_order_item_inline),
     GENERATED_KEY(COLUMN= order_item_id, GENERATED_KEY_ALGORITHM=snowflake)
);
