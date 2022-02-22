rules:
- !ENCRYPT
  tables:
    t_encrypt:
      columns:
        name:
          plainColumn: name_plain
          cipherColumn: name
          encryptorName: name-encryptor
        password:
          cipherColumn: password
          encryptorName: password_encryptor
  encryptors:
    name-encryptor:
      type: AES
      props:
        aes-key-value: 123456abc
    password_encryptor:
      type: MD5
