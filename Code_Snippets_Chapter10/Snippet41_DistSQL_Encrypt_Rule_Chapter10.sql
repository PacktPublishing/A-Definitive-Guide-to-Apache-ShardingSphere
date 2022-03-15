CREATE ENCRYPT RULE t_encrypt (
COLUMNS(
(NAME=password,CIPHER=password_cipher,TYPE(NAME=AES,PROPERTIES('aes-key-value'='123456abc'))))
);
