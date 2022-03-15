public interface SingleTableDataCalculator {
  
  /**
  * Get algorithm type.
  *
  * @return algorithm type
  */
  String getAlgorithmType();
  
  /**
  * Get database types.
  *
  * @return database types
  */
  Collection<String> getDatabaseTypes();
  
  /**
  * Get algorithm properties.
  *
  * @return properties
  */
  Properties getAlgorithmProps();
  
  /**
  * Set algorithm properties.
  * Used by data consistency check algorithm.
  *
  * @param algorithmProps algorithm properties
  */
  void setAlgorithmProps(Properties algorithmProps);
  
  /**
  * Initialize create data calculator.
  */
  void init();
  
  /**
  * Calculate table data content, return checksum typically.
  *
  * @param dataCalculateParameter data calculate parameter
* @return calculated result, it will be used to check equality.
*/
  Iterable<Object> calculate(DataCalculateParameter dataCalculateParameter);
}
