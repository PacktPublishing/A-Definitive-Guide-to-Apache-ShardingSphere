@RequiredArgsConstructor
@Getter
public enum CustomPropertyKey implements TypedPropertyKey {
  
  CUSTOM_TIME_OUT("customTimeOut", String.valueOf(30), long.class),
  
  CUSTOM_MAX_RETRIES("customMaxRetries", String.valueOf(3), int.class)
  ;
                                                                                            
                                                                                            private final String key;
  
  private final String defaultValue;
  
  private final Class<?> type;
}
