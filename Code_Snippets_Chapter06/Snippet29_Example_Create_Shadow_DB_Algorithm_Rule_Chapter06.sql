CREATE SHADOW ALGORITHM 
(simple_hint_algorithm, TYPE(NAME=SIMPLE_HINT, PROPERTIES("foo"="bar"))), 
(user_id_match_algorithm, TYPE(NAME=REGEX_MATCH,PROPERTIES("operation"="insert", "column"="user_id", "regex"='[1]')));
