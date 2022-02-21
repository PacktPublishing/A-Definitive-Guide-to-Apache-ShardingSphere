-- 1. Add Database Sources
ADD RESOURCE ds_0 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=ds_0,
     USER=root,
     PASSWORD=123456
);
ADD RESOURCE ds_1 (
     HOST=127.0.0.1,
     PORT=3306,
     DB=ds_1,
     USER=root,
     PASSWORD=123456
);

-- 2. Create Default Single Table Data Resource Rules
CREATE DEFAULT SINGLE TABLE RULE RESOURCE = ds_0

-- 3. Modify Default Single Table Data Resource Rules
ALTER DEFAULT SINGLE TABLE RULE RESOURCE = ds_1;

-- 4. Query Default Single Table Data Resource Rules
SHOW SINGLE TABLE RULES;
+---------+---------------+
| name    | resource_name |
+---------+---------------+
| default | ds_1          |
+---------+---------------+

-- 5. Delete Default Single Table Data Resource Rules
DROP DEFAULT SINGLE TABLE RULE;
