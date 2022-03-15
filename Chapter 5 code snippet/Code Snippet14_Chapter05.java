public DataSource getDataSource() throws SQLException {
    Map<String, DataSource> dataSourceMap = createDataSourceMap();
    Collection<RuleConfiguration> ruleConfigurations = createRuleConfiguration();
    Properties properties = new Properties();
    properties.setProperty(ConfigurationPropertyKey.SQL_SHOW.getKey(), "true");
    return ShardingSphereDataSourceFactory.createDataSource(dataSourceMap, ruleConfigurations, properties);
}

private Map<String, DataSource> createDataSourceMap() {
    Map<String, DataSource> result = new LinkedHashMap<>();
    result.put("ds", DataSourceUtil.createDataSource("ds"));
    result.put("ds_shadow", DataSourceUtil.createDataSource("ds_shadow"));
    return result;
}

private Collection<RuleConfiguration> createRuleConfiguration() {
    Collection<RuleConfiguration> result = new LinkedList<>();
    result.add(createSQLParserRuleConfiguration());
    result.add(createShadowRuleConfiguration());
    return result;
}

private SQLParserRuleConfiguration createSQLParserRuleConfiguration() {
    CacheOption parserTreeCacheOption = new CacheOption(128, 1024L, 4);
    CacheOption sqlStatementCacheOption = new CacheOption(2000, 65535L, 4);
    return new SQLParserRuleConfiguration(true, parserTreeCacheOption, sqlStatementCacheOption);
}

private RuleConfiguration createShadowRuleConfiguration() {
    ShadowRuleConfiguration result = new ShadowRuleConfiguration();
    result.setShadowAlgorithms(createShadowAlgorithmConfigurations());
    result.setDataSources(createShadowDataSources());
    result.setTables(createShadowTables());
    return result;
}

private Map<String, ShardingSphereAlgorithmConfiguration> createShadowAlgorithmConfigurations() {
    Map<String, ShardingSphereAlgorithmConfiguration> result = new LinkedHashMap<>();
    Properties userIdInsertProps = new Properties();
    userIdInsertProps.setProperty("operation", "insert");
    userIdInsertProps.setProperty("column", "user_type");
    userIdInsertProps.setProperty("value", "1");
    result.put("user-id-insert-match-algorithm", new ShardingSphereAlgorithmConfiguration("VALUE_MATCH", userIdInsertProps));
    Properties hintAlgorithmProps = new Properties();
    hintAlgorithmProps.setProperty("foo", "bar");
    result.put("simple-hint-algorithm", new ShardingSphereAlgorithmConfiguration("SIMPLE_HINT", hintAlgorithmProps));
    return result;
}

private Map<String, ShadowDataSourceConfiguration> createShadowDataSources() {
    Map<String, ShadowDataSourceConfiguration> result = new LinkedHashMap<>();
    result.put("shadow-data-source", new ShadowDataSourceConfiguration("ds", "ds_shadow"));
    return result;
}

private Map<String, ShadowTableConfiguration> createShadowTables() {
    Map<String, ShadowTableConfiguration> result = new LinkedHashMap<>();
    result.put("t_user", new ShadowTableConfiguration(createDataSourceNames(), createShadowAlgorithmNames()));
    return result;
}

private Collection<String> createDataSourceNames() {
    Collection<String> result = new LinkedList<>();
    result.add("shadow-data-source");
    return result;
}

private Collection<String> createShadowAlgorithmNames() {
    Collection<String> result = new LinkedList<>();
    result.add("user-id-insert-match-algorithm");
    result.add("simple-hint-algorithm");
    return result;
}
