CREATE SHARDING KEY GENERATOR snowflake (
     TYPE(NAME=SNOWFLAKE, PROPERTIES("worker-id"=123))
);