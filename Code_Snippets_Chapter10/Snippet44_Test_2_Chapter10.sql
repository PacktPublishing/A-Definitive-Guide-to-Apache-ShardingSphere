DROP TABLE IF EXISTS t_encrypt；
CREATE TABLE t_encrypt (
    `id` int(11) NOT NULL,
    `name` varchar(32) DEFAULT NULL,
    `password` varchar(64) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
