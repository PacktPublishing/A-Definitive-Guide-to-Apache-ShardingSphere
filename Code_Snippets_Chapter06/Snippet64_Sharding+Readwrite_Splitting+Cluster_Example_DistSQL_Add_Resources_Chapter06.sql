USE sharding_db;
-- 1.Add database resource
ADD RESOURCE write_ds_0 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=write_ds_0,
     USER=root,
     PASSWORD=root
), write_ds_1 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=write_ds_1,
     USER=root,
     PASSWORD=root
), write_ds_0_read_0 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=write_ds_0_read_0,
     USER=root,
     PASSWORD=root
), write_ds_0_read_1 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=write_ds_0_read_0,
     USER=root,
     PASSWORD=root
), write_ds_1_read_0 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=write_ds_0_read_0,
     USER=root,
     PASSWORD=root
), write_ds_1_read_0 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=write_ds_0_read_0,
     USER=root,
     PASSWORD=root
);
