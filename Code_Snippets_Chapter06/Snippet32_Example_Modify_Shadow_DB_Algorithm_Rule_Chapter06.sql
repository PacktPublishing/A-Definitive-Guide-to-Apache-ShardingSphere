ALTER SHADOW RULE shadow_rule(SOURCE=ds,SHADOW=ds_shadow,
t_order((simple_hint_algorithm, TYPE(NAME=SIMPLE_HINT, PROPERTIES("foo"="bar"))),(TYPE(NAME=REGEX_MATCH, PROPERTIES("operation"="insert","column"="user_id", "regex"='[1]')))), 
t_order_item((TYPE(NAME=VALUE_MATCH, PROPERTIES("operation"="insert","column"="user_id", "value"='1')))));
