public final class CustomizeHintShadowAlgorithm implements HintShadowAlgorithm<String> {
  
  @Override
  public void init() {
  } 
  
  @Override
  public boolean isShadow(final Collection<String> relatedShadowTables, final PreciseHintShadowValue<String> preciseHintShadowValue) {
  // TODO Custom Shadow Algorithm Judgment
  return true/false;
}
                                                                                        
  @Override
                                                                                        public String getType() {
                                                                                          return "CUSTOMIZE_HINT";
                                                                                        }
}
