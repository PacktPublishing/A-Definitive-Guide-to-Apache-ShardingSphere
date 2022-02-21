ALTER SHADOW ALGORITHM 
(simple_hint_algorithm, TYPE(NAME=SIMPLE_HINT, PROPERTIES("foo"="bar"))), 
(user_id_match_algorithm, TYPE(NAME=VALUE_MATCH,PROPERTIES("operation"="insert", "column"="user_id", "value"='1')));
