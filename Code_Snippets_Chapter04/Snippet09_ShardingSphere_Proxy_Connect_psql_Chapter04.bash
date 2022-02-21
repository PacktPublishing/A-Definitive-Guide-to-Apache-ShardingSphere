% psql -h 127.0.0.1 -p 3307 -U proxy_user -d proxy_db
Password for user proxy_user: 
psql (14.0 (Debian 14.0-1.pgdg110+1))
Type "help" for help.

proxy_db=> show schema resources;
   name   |    type    |   host    | port |    db    |                                                                          attribute   
                                                                       
----------+------------+-----------+------+----------+--------------------------------------------------------------------------------------
-----------------------------------------------------------------------
 postgres | PostgreSQL | 127.0.0.1 | 5432 | postgres | {"maxLifetimeMilliseconds":1800000,"readOnly":false,"minPoolSize":1,"idleTimeoutMilli
seconds":60000,"maxPoolSize":50,"connectionTimeoutMilliseconds":30000}
(1 row)
