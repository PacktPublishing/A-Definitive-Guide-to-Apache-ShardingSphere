
public final class NormalEncryptAlgorithmFixture implements EncryptAlgorithm<Object, String> {
  @Override
  public void init() {
  }
  @Override
  public String encrypt(final Object plainValue) {
    return "encrypt_" + plainValue;
  }
  @Override
  public Object decrypt(final String cipherValue) {
   return cipherValue.replaceAll("encrypt_", "");
 }
                                                                                               @Override
  public String getType() {
    return "NORMAL_ENCRYPT";
  }
}
