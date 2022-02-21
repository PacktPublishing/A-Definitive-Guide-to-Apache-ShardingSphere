/** 1. Create the database readwrite_splitting_db **/
create database readwrite_splitting_db;

/** 2. Use the database readwrite_splitting_db **/
use readwrite_splitting_db;

/** 3. Add the database sources write_ds、read_ds_0、read_ds_1 **/
ADD RESOURCE write_ds (
     HOST=127.0.0.1,
     PORT=3306,
     DB=demo_write_ds,
     USER=root,
     PASSWORD=123456
);
ADD RESOURCE read_ds_0 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=demo_read_ds_0,
     USER=root,
     PASSWORD=123456
);
ADD RESOURCE read_ds_1 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=demo_read_ds_1,
     USER=root,
     PASSWORD=123456
);

/** 4. Create the read/write-splitting rule write_read_ds **/
CREATE READWRITE_SPLITTING RULE write_read_ds (
WRITE_RESOURCE=write_ds,
READ_RESOURCES(read_ds_0, read_ds_1),
TYPE(NAME=random)
);

/** 5. View the read/write-splitting rule write_read_ds **/
SHOW READWRITE_SPLITTING RULES FROM readwrite_splitting_db;

+---------------+-----------------------------+------------------------+------------------------+--------------------+---------------------+
| name          | auto_aware_data_source_name | write_data_source_name | read_data_source_names | load_balancer_type | load_balancer_props |
+---------------+-----------------------------+------------------------+------------------------+--------------------+---------------------+
| write_read_ds | NULL                        | write_ds               | read_ds_0,read_ds_1    | random             |                     |
+---------------+-----------------------------+------------------------+------------------------+--------------------+---------------------+

/** 6. Modify the read/write-splitting rule write_read_ds **/
ALTER READWRITE_SPLITTING RULE write_read_ds (
WRITE_RESOURCE=write_ds,
READ_RESOURCES(read_ds_0),
TYPE(NAME=random)
);

/** 7. View the changed read/write splitting rule write_read_ds **/
SHOW READWRITE_SPLITTING RULES FROM readwrite_splitting_db;
+---------------+-----------------------------+------------------------+------------------------+--------------------+---------------------+
| name          | auto_aware_data_source_name | write_data_source_name | read_data_source_names | load_balancer_type | load_balancer_props |
+---------------+-----------------------------+------------------------+------------------------+--------------------+---------------------+
| write_read_ds | NULL                        | write_ds               | read_ds_0              | random             |                     |
+---------------+-----------------------------+------------------------+------------------------+--------------------+---------------------+

/** 8. View All Read Database State **/
SHOW readwrite_splitting READ RESOURCES FROM readwrite_splitting_db;
+-----------+--------+
| resource  | status |
+-----------+--------+
| read_ds_0 | enable |
+-----------+--------+

/** 9. Disable Read Databases **/
DISABLE readwrite_splitting READ read_ds_0 FROM readwrite_splitting_db;

/** 10. Enable Read Databases **/
ENABLE readwrite_splitting READ read_ds_0 FROM readwrite_splitting_db;

/** 11. Delete the read/write splitting rule write_read_ds **/
DROP READWRITE_SPLITTING RULE write_read_ds;

/** 12. Delete the distributed database readwrite_splitting_db **/
DROP DATABASE readwrite_splitting_db; 
