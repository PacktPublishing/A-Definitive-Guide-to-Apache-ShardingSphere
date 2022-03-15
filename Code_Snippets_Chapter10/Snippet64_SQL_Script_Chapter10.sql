\c demo_primary_ds;
CREATE TABLE t_order (
   order_id INT PRIMARY KEY NOT NULL,
   user_id INT NOT NULL,
   status CHAR(10) NOT NULL
);

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

\c demo_replica_ds_0;
CREATE TABLE t_order (
   order_id INT PRIMARY KEY NOT NULL,
   user_id INT NOT NULL,
   status CHAR(10) NOT NULL
);

INSERT INTO t_order (order_id, user_id, status)
VALUES (1, 20001, 'read_0'),
       (2, 20002, 'read_0'),
       (3, 20003, 'read_0'),
       (4, 20004, 'read_0'),
       (5, 20005, 'read_0'),
       (6, 20006, 'read_0'),
       (7, 20007, 'read_0'),
       (8, 20008, 'read_0'),
       (9, 20009, 'read_0'),
       (10, 20010, 'read_0');
       
\c demo_replica_ds_1;
CREATE TABLE t_order (
   order_id INT PRIMARY KEY NOT NULL,
   user_id INT NOT NULL,
   status CHAR(10) NOT NULL
);

INSERT INTO t_order (order_id, user_id, status)
VALUES (1, 30001, 'read_1'),
       (2, 30002, 'read_1'),
       (3, 30003, 'read_1'),
       (4, 30004, 'read_1'),
       (5, 30005, 'read_1'),
       (6, 30006, 'read_1'),
       (7, 30007, 'read_1'),
       (8, 30008, 'read_1'),
       (9, 30009, 'read_1'),
       (10, 30010, 'read_1');
