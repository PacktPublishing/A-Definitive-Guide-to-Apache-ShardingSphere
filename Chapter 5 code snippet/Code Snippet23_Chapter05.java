public final class ReadwriteSplittingConfigurationCreator {
    
    public static ReadwriteSplittingRuleConfiguration create() {
        ReadwriteSplittingDataSourceRuleConfiguration dataSourceConfiguration1 = new ReadwriteSplittingDataSourceRuleConfiguration(
                "ds_0", "", "demo_write_ds_0", Arrays.asList("demo_write_ds_0_read_0", "demo_write_ds_0_read_1"), null);
        ReadwriteSplittingDataSourceRuleConfiguration dataSourceConfiguration2 = new ReadwriteSplittingDataSourceRuleConfiguration(
                "ds_1", "", "demo_write_ds_1", Arrays.asList("demo_write_ds_1_read_0", "demo_write_ds_1_read_1"), null);
        return new ReadwriteSplittingRuleConfiguration(Arrays.asList(dataSourceConfiguration1, dataSourceConfiguration2), Collections.emptyMap());
    }
}
