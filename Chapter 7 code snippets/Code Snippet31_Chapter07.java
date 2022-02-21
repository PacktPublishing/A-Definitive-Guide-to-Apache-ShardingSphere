public final class PreciseHintShadowValue<T extends Comparable<?>> implements ShadowValue {
  private final String logicTableName;
  
  private final ShadowOperationType shadowOperationType;
  
  private final T value;
}
