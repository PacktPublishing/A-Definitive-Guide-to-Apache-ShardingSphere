-- Encrypt password column and store the value encrypted in password_cipher column
CREATE ENCRYPT RULE t_encrypt (
COLUMNS(
(NAME=password,CIPHER=password_cipher,TYPE(NAME=AES,PROPERTIES('aes-key-value'='123456abc')))
));
