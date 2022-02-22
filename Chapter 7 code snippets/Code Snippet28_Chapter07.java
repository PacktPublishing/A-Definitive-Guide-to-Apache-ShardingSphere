public class CustomizeColumnMatchShadowAlgorithm implements ColumnShadowAlgorithm<Comparable<?>> {
  @Override
  public void init() {
  } 
  @Override
  public boolean isShadow(final PreciseColumnShadowValue<Comparable<?>> preciseColumnShadowValue) {
  // TODO Custom Shadow Algorithm Judgment
  return true/false;
}
                                                                                                  @Override
                                                                                                  public String getType() {
                                                                                                    return "CUSTOMIZE_COLUMN";
                                                                                                  }
}
