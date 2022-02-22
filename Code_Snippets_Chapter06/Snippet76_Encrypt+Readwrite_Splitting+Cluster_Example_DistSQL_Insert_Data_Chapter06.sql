-- SQL statement input
INSERT INTO t_encrypt (user_name, password) VALUES ('user_name', 'plain_password');

-- Actual SQL statement executed by ShardingSphere
INSERT INTO t_encrypt (user_name, password_cipher) VALUES ('user_name', 'OYd7QrmOWUiJKBj0oDkNIw==');
