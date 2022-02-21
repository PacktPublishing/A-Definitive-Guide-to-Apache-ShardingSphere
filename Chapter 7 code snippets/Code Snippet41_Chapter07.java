@Override
public void init(final ClusterPersistRepositoryConfiguration config) {
  CustomProperties properties = new CustomProperties(config.getProps());
                                                                                long customTimeOut = properties.getValue(CustomPropertyKey.CUSTOM_TIME_OUT);
  long customMaxRetries = properties.getValue(CustomPropertyKey.CUSTOM_MAX_RETRIES);
}
