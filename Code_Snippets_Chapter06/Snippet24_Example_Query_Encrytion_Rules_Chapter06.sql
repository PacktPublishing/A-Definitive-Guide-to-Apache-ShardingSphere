show encrypt rules from encrypt_db;
+-----------+--------------+------------------+--------------+----------------+-----------------+
| table     | logic_column | cipher_column    | plain_column | encryptor_type | encryptor_props |
+-----------+--------------+------------------+--------------+----------------+-----------------+
| t_encrypt | user_name    | user_name_cipher | NULL         | MD5            |                 |
| t_encrypt | password     | password_cipher  | NULL         | MD5            |                 |
+-----------+--------------+------------------+--------------+----------------
