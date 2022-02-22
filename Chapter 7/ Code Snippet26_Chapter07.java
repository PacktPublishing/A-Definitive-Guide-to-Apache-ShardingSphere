public interface AuthorityProvideAlgorithm extends ShardingSphereAlgorithm {
  /**
  * Initialize authority.
  * 
  * @param metaDataMap meta data map
  * @param users users
  */
  void init(Map<String, ShardingSphereMetaData> metaDataMap, Collection<ShardingSphereUser> users);
  /**
  * Refresh authority.
  *
  * @param metaDataMap meta data map
  * @param users users
  */
  void refresh(Map<String, ShardingSphereMetaData> metaDataMap, Collection<ShardingSphereUser> users);
  /**
* Find Privileges.
*
* @param grantee grantee
* @return found privileges
*/
                                                                            Optional<ShardingSpherePrivileges> findPrivileges(Grantee grantee);
                                                                            }
