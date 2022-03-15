USE encrypt_db_0;
DROP TABLE IF EXISTS t_encrypt_0；
CREATE TABLE t_encrypt_0 (
    `id` int(11) NOT NULL,
    `name` varchar(32) DEFAULT NULL,
    `password` varchar(64) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

USE encrypt_db_1;
DROP TABLE IF EXISTS t_encrypt_1；
CREATE TABLE t_encrypt_1 (
    `id` int(11) NOT NULL,
    `name` varchar(32) DEFAULT NULL,
    `password` varchar(64) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
