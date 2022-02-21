public final class ShardingConfigurationCreator {
    
    public static ShardingRuleConfiguration create() {
        ShardingRuleConfiguration result = new ShardingRuleConfiguration();
        result.getTables().add(createOrderTableRuleConfiguration());
        result.getTables().add(createOrderItemTableRuleConfiguration());
        result.getBindingTableGroups().add("t_order, t_order_item");
        result.getBroadcastTables().add("t_address");
        result.setDefaultDatabaseShardingStrategy(new StandardShardingStrategyConfiguration("user_id", "database_inline"));
        result.getShardingAlgorithms().put("t_order_item_inline", new ShardingSphereAlgorithmConfiguration("INLINE", createSingleProperties("algorithm-expression", "t_order_item_${order_id % 2}")));
        result.getShardingAlgorithms().put("t_order_inline", new ShardingSphereAlgorithmConfiguration("INLINE", createSingleProperties("algorithm-expression", "t_order_${order_id % 2}}")));
        result.getShardingAlgorithms().put("database_inline", new ShardingSphereAlgorithmConfiguration("INLINE", createSingleProperties("algorithm-expression", "ds_${user_id % 2}")));
        result.getKeyGenerators().put("snowflake", new ShardingSphereAlgorithmConfiguration("SNOWFLAKE", createSingleProperties("worker-id", "123")));
        return result;
    }
    
    private static ShardingTableRuleConfiguration createOrderTableRuleConfiguration() {
        ShardingTableRuleConfiguration result = new ShardingTableRuleConfiguration("t_order", "ds_${0..1}.t_order_${[0, 1]}");
        result.setTableShardingStrategy(new StandardShardingStrategyConfiguration("order_id","t_order_inline"));
        result.setKeyGenerateStrategy(new KeyGenerateStrategyConfiguration("order_id", "snowflake"));
        return result;
    }
    
    private static ShardingTableRuleConfiguration createOrderItemTableRuleConfiguration() {
        ShardingTableRuleConfiguration result = new ShardingTableRuleConfiguration("t_order_item", "ds_${0..1}.t_order_item_${[0, 1]}");
        result.setTableShardingStrategy(new StandardShardingStrategyConfiguration("order_item_id","t_order_item_inline"));
        result.setKeyGenerateStrategy(new KeyGenerateStrategyConfiguration("order_id", "snowflake"));
        return result;
    }
    
    private static Properties createSingleProperties(final String key, final String value) {
        Properties result = new Properties();
        result.setProperty(key, value);
        return result;
    }
}
