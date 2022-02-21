# Create a Logic Database
CREATE DATABASE sharding_db;
# sharding_db Connect to sharding_db
USE sharding_db;
# Add Data Resource
ADD RESOURCE ds_0 (
    HOST=localhost,
    PORT=3306,
    DB=db0,
    USER=root
);
# Create Sharding Rules
CREATE SHARDING TABLE RULE t_order (
RESOURCES(ds_0),
SHARDING_COLUMN=order_id,TYPE(NAME=hash_mod,PROPERTIES("sharding-count"=4))
);
