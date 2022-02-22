public interface DataConsistencyCheckAlgorithm extends ShardingSphereAlgorithm, ShardingSphereAlgorithmPostProcessor, SingletonSPI {
  
  /**
  * Get algorithm description.
  *
  * @return algorithm description
  */
  String getDescription();
  
  /**
  * Get supported database types.
  *
  * @return supported database types
  */
  Collection<String> getSupportedDatabaseTypes();
  
  /**
  * Get algorithm provider.
  *
  * @return algorithm provider
  */
  String getProvider();
  /**
  * Get single table data calculator.
  *
  * @param supportedDatabaseType supported database type
  * @return single table data calculator
*/
                                                                                                                                    SingleTableDataCalculator getSingleTableDataCalculator(String supportedDatabaseType);
}
