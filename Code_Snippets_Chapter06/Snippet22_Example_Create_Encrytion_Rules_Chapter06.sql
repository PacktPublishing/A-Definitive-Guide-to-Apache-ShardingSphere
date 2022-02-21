CREATE ENCRYPT RULE t_encrypt (
COLUMNS(
(NAME=user_name,PLAIN=user_name_plain,CIPHER=user_name_cipher,TYPE(NAME=AES,PROPERTIES('aes-key-value'='123456abc'))),
(NAME=password, CIPHER =password_cipher,TYPE(NAME=MD5))
),QUERY_WITH_CIPHER_COLUMN=true);
