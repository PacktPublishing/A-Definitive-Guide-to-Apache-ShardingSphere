-- Start transaction and submit
mysql> BEGIN;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM account;
+----+---------+
| id | balance |
+----+---------+
| 1 |    0 |
| 2 |   100 |
+----+---------+
2 rows in set (0.00 sec)

mysql> UPDATE account SET balance=1 WHERE id=1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1 Changed: 1 Warnings: 0

mysql> SELECT * FROM account;
+----+---------+
| id | balance |
+----+---------+
| 1 |    1 |
| 2 |   100 |
+----+---------+
2 rows in set (0.00 sec)

mysql> UPDATE account SET balance=99 WHERE id=2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1 Changed: 1 Warnings: 0

mysql> SELECT * FROM account;
+----+---------+
| id | balance |
+----+---------+
| 1 |    1 |
| 2 |   99 |
+----+---------+
2 rows in set (0.00 sec)

mysql> COMMIT;
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM account;
+----+---------+
| id | balance |
+----+---------+
| 1 |    1 |
| 2 |   99 |
+----+---------+
2 rows in set (0.00 sec)

-- Start transaction and rollback
mysql> BEGIN;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM account;
+----+---------+
| id | balance |
+----+---------+
| 1 |    1 |
| 2 |   99 |
+----+---------+
2 rows in set (0.00 sec)

mysql> UPDATE account SET balance=0 WHERE id=1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1 Changed: 1 Warnings: 0

mysql> SELECT * FROM account;
+----+---------+
| id | balance |
+----+---------+
| 1 |    0 |
| 2 |   99 |
+----+---------+
2 rows in set (0.01 sec)

mysql> UPDATE account SET balance=100 WHERE id=2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1 Changed: 1 Warnings: 0

mysql> SELECT * FROM account;
+----+---------+
| id | balance |
+----+---------+
| 1 |    0 |
| 2 |   100 |
+----+---------+
2 rows in set (0.00 sec)

mysql> ROLLBACK;
Query OK, 0 rows affected (0.02 sec)

mysql> SELECT * FROM account;
+----+---------+
| id | balance |
+----+---------+
| 1 |    1 |
| 2 |   99 |
+----+---------+
2 rows in set (0.01 sec)
