String sql = "SELECT * FROM t_order";
// Obtain HintManager Instance
try (HintManager hintManager = HintManager.getInstance();
     Connection connection = dataSource.getConnection();
     PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
    // Add Database Sharding Value
    hintManager.addDatabaseShardingValue("t_order", 2);
    // Add Table Sharding Value
    hintManager.addTableShardingValue("t_order", 1);
    try (ResultSet resultSet = preparedStatement.executeQuery()) {
        while (resultSet.next()) {
            // ...
        }
    }
}
