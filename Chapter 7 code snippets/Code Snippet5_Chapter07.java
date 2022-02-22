
public class MyDBRangeShardingAlgorithm implements StandardShardingAlgorithm<Integer> {
  @Override
  public String doSharding(final Collection<String> availableTargetNames, final PreciseShardingValue<Integer> shardingValue) {
    return null;
  }
  @Override
  public Collection<String> doSharding(final Collection<String> availableTargetNames, final RangeShardingValue<Integer> shardingValue) {
   return null;
 }
                                                                                        @Override
  public void init() { }
  @Override
  public String getType() {
    return "CLASS_BASED";
  }
}
