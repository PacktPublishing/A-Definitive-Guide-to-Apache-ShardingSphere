CREATE READWRITE_SPLITTING RULE ds_0 (
    WRITE_RESOURCE=write_ds_0,
    READ_RESOURCES(write_ds_0_read_ds_0, write_ds_0_read_ds_1),TYPE(NAME=ROUND_ROBIN)
), ds_1 (
    WRITE_RESOURCE=write_ds_1,
    READ_RESOURCES(write_ds_1_read_ds_0, write_ds_1_read_ds_1),TYPE(NAME=ROUND_ROBIN)
);
