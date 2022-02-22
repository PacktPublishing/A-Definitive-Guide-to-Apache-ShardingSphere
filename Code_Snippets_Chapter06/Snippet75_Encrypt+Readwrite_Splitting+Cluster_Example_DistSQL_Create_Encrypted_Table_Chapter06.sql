DROP TABLE IF EXISTS t_encrypt;
-- SQL statement input
CREATE TABLE t_encrypt (
  id INT NOT NULL AUTO_INCREMENT, 
  user_name VARCHAR(32) NOT NULL, 
  password VARCHAR(64) NOT NULL, 
  PRIMARY KEY (id)
);

-- Actual SQL statement executed by ShardingSphere
CREATE TABLE t_encrypt (
  id INT NOT NULL AUTO_INCREMENT, 
  user_name VARCHAR(32) NOT NULL, 
  password_cipher VARCHAR(64) NOT NULL, 
  PRIMARY KEY (id)
)
