mysql> show shadow algorithms;

+-------------------------+--------------------+-------------------------------------------+----------------+
| shadow_algorithm_name   | type               | props                                     | is_default     |
+-------------------------+--------------------+-------------------------------------------+----------------+
| user_id_match_algorithm | REGEX_MATCH        | operation=insert,column=user_id,regex=[1] | false          |
| simple_hint_algorithm_1 | SIMPLE_HINT        | foo=bar                                   | false          |
+-------------------------+--------------------+-------------------------------------------+----------------+
2 rows in set (0.01 sec)
