CREATE TABLE `t_order` (
    `id` INT(11) AUTO_INCREMENT,
    `user_id` VARCHAR(32) NOT NULL,
    `sku` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`)
)ENGINE = InnoDB;
