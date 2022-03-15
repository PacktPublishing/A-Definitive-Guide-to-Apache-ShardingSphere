ds_0:
CREATE TABLE `t_order` (
`order_id` int(11) NOT NULL,
`user_id` varchar(18) NOT NULL,
`status` varchar(255) NOT NULL,
PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ds_1:
CREATE TABLE `t_user` (
`id` int(8) NOT NULL,
`mobile` char(20) NOT NULL,
`idcard` varchar(18) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
