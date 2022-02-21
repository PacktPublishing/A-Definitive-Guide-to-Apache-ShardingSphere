ALTER ENCRYPT RULE t_encrypt (
COLUMNS(
(NAME=user_name,CIPHER=user_name_cipher,TYPE(NAME=MD5)),
(NAME=password,CIPHER=password_cipher,TYPE(NAME=MD5))
), QUERY_WITH_CIPHER_COLUMN=TRUE);
