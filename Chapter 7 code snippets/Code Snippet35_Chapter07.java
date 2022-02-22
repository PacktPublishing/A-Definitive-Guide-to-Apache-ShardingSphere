public final class CustomPersistRepository implements ClusterPersistRepository{
  
  @Override
  public String get(final String key) {
    return null;
  }
  
  @Override
  public List<String> getChildrenKeys(final String key) {
    return null;
  }
  
  @Override
  public void persist(final String key, final String value) {
  }
  
  @Override
  public void delete(final String key) {
    
  }
  
  @Override
  public void close() {
    
  }
  
  @Override
  public void init(final ClusterPersistRepositoryConfiguration config) {
    
  }
  
  @Override
  public void persistEphemeral(final String key, final String value) {
    
  }
  
  @Override
  public String getSequentialId(final String key, final String value) {
    return null;
  }
  
  @Override
  public void watch(final String key, final DataChangedEventListener listener) {
    
  }
  
  @Override
  public boolean tryLock(final String key, final long time, final TimeUnit unit) {
    return false;
}
                                                                               
                                                                               @Override
  public void releaseLock(final String key) {
    
  }
  
  @Override
  public String getType() {
    return "CustomRepository";
  }
}
