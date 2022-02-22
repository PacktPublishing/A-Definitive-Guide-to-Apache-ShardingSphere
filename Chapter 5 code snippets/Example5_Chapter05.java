public DataSource getDataSource() throws SQLException {
    ReadwriteSplittingDataSourceRuleConfiguration dataSourceConfig = new ReadwriteSplittingDataSourceRuleConfiguration(
            "demo_read_query_ds", "", "demo_write_ds", Arrays.asList("demo_read_ds_0", "demo_read_ds_1"), "demo_weight_lb");
    Properties algoritProperties = new Properties();
    algoritProperties.put("demo_read_ds_0", "2");
    algoritProperties.put("demo_read_ds_1", "1");
    ShardingSphereAlgorithmConfiguration algorithmConfiguration = new ShardingSphereAlgorithmConfiguration("WEIGHT", algoritProperties);
    Map<String, ShardingSphereAlgorithmConfiguration> sphereAlgorithmConfigurationMap = new HashMap<>(1);
    sphereAlgorithmConfigurationMap.put("demo_weight_lb", algorithmConfiguration);
    ReadwriteSplittingRuleConfiguration ruleConfig = new ReadwriteSplittingRuleConfiguration(Collections.singleton(dataSourceConfig), sphereAlgorithmConfigurationMap);
    Properties properties = new Properties();
    properties.setProperty("sql-show", String.valueOf(true));
    return ShardingSphereDataSourceFactory.createDataSource(createDataSourceMap(), Collections.singleton(ruleConfig), properties);
}

private Map<String, DataSource> createDataSourceMap() {
    Map<String, DataSource> result = new HashMap<>(3, 1);
    result.put("demo_write_ds", DataSourceUtil.createDataSource("demo_write_ds"));
    result.put("demo_read_ds_0", DataSourceUtil.createDataSource("demo_read_ds_0"));
    result.put("demo_read_ds_1", DataSourceUtil.createDataSource("demo_read_ds_1"));
    return result;
}
