public final class PreciseColumnShadowValue<T extends Comparable<?>> implements ShadowValue {
  
  private final String logicTableName;
  private final ShadowOperationType shadowOperationType;
  private final String columnName;
  private final T value;
}
