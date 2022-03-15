USE write_ds;
INSERT INTO t_order (order_id, user_id, status)
VALUES (1, 10001, 'write'),
(2, 10002, 'write'),
(3, 10003, 'write'),
(4, 10004, 'write'),
(5, 10005, 'write'),
(6, 10006, 'write'),
(7, 10007, 'write'),
(8, 10008, 'write'),
(9, 10009, 'write'),
(10, 10010, 'write');

USE read_ds;
INSERT INTO t_order (order_id, user_id, status)
VALUES (1, 20001, 'read'),
(2, 20002, 'read'),
(3, 20003, 'read'),
(4, 20004, 'read'),
(5, 20005, 'read'),
(6, 20006, 'read'),
(7, 20007, 'read'),
(8, 20008, 'read'),
(9, 20009, 'read'),
(10, 20010, 'read');
