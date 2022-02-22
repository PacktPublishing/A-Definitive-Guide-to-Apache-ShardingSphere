public DataSource getDataSource() throws SQLException {
    return ShardingSphereDataSourceFactory.createDataSource(createModeConfiguration(), createDataSourceMap(), Collections.singleton(createShardingRuleConfiguration()), new Properties());
}

private ShardingRuleConfiguration createShardingRuleConfiguration() {
    ShardingRuleConfiguration result = new ShardingRuleConfiguration();
    result.getTables().add(getOrderTableRuleConfiguration());
    result.getTables().add(getOrderItemTableRuleConfiguration());
    result.getBroadcastTables().add("t_address");
    result.setDefaultDatabaseShardingStrategy(new StandardShardingStrategyConfiguration("user_id", "inline"));
    Properties props = new Properties();
    props.setProperty("algorithm-expression", "demo_ds_${user_id % 2}");
    result.getShardingAlgorithms() .put("inline", new ShardingSphereAlgorithmConfiguration("INLINE", props));
    result.getKeyGenerators().put("snowflake", new ShardingSphereAlgorithmConfiguration("SNOWFLAKE", getProperties()));
    return result;
}

private static ModeConfiguration createModeConfiguration() {
    return new ModeConfiguration("Standalone", new StandalonePersistRepositoryConfiguration("File", new Properties()), true);
}

private static ShardingTableRuleConfiguration getOrderTableRuleConfiguration() {
    ShardingTableRuleConfiguration result = new ShardingTableRuleConfiguration("t_order");
    result.setKeyGenerateStrategy(new KeyGenerateStrategyConfiguration("order_id", "snowflake"));
    return result;
}

private static ShardingTableRuleConfiguration getOrderItemTableRuleConfiguration() {
    ShardingTableRuleConfiguration result = new ShardingTableRuleConfiguration("t_order_item");
    result.setKeyGenerateStrategy(new KeyGenerateStrategyConfiguration("order_item_id", "snowflake"));
    return result;
}

private static Map<String, DataSource> createDataSourceMap() {
    Map<String, DataSource> result = new HashMap<>(2, 1);
    result.put("demo_ds_0", DataSourceUtil.createDataSource("demo_ds_0"));
    result.put("demo_ds_1", DataSourceUtil.createDataSource("demo_ds_1"));
    return result;
}

private static Properties getProperties() {
    Properties result = new Properties();
    result.setProperty("worker-id", "123");
    return result;
}
