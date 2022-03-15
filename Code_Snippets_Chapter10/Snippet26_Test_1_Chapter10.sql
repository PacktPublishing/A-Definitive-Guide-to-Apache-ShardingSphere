psql -U root -d sharding_db -h 127.0.0.1 -p 3307

CREATE SHARDING TABLE RULE t_user (
    RESOURCES(ds_0, ds_1),
    SHARDING_COLUMN=id,TYPE(NAME=MOD,PROPERTIES("sharding-count"=4))
);
