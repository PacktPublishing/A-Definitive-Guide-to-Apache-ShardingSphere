Properties props = new Properties();
props.setProperty("parameterized", "false");
CacheOption cacheOption = new CacheOption(128, 1024L, 4);
SQLParserEngine parserEngine = new SQLParserEngine("MySQL", cacheOption, false);
ParseContext parseContext = parserEngine.parse("SELECT age AS b, name AS n FROM table1 JOIN table2 WHERE id = 1 AND name = 'lu';", false);
SQLVisitorEngine visitorEngine = new SQLVisitorEngine("MySQL", "FORMAT", props);
String result = visitorEngine.visit(parseContext);
System.out.println(result);
