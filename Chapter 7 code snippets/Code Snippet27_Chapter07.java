public interface ShardingSpherePrivileges {
  /**
  * Set super privilege.
  */
  void setSuperPrivilege();
  /**
  * Has privileges.
  *
  * @param schema schema
  * @return has privileges or not
  */
  boolean hasPrivileges(String schema);
  /**
  * Has privileges.
  *
  * @param privileges privileges
  * @return has privileges or not
  */
  boolean hasPrivileges(Collection<PrivilegeType> privileges);
  /**
  * Has privileges.
  *
  * @param accessSubject access subject
* @param privileges privileges
* @return has privileges or not
*/
  boolean hasPrivileges(AccessSubject accessSubject, Collection<PrivilegeType> privileges);
}
