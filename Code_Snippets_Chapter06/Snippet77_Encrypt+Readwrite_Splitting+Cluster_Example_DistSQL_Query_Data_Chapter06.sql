-- Data directly queried in physical data source, passwd has been encrypted
SELECT * FROM t_encrypt;
+----+-----------+--------------------------+
| id | user_name | password_cipher          |
+----+-----------+--------------------------+
|  1 | user_name | OYd7QrmOWUiJKBj0oDkNIw== |
+----+-----------+--------------------------+

-- Data queried in ShardingSphere, has been automatically decrypted
SELECT * FROM t_encrypt;
+----+-----------+----------------+
| id | user_name | password       |
+----+-----------+----------------+
|  1 | user_name | plain_password |
+----+-----------+----------------+
