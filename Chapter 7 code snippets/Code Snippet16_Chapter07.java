public void test() {
  Connection connection = null;
  Statement statement1 = null;
  Statement statement2 = null;
  try {
    connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/test", "root", "root");
    connection.setAutoCommit(false);
    statement1 = connection.createStatement();
    statement1.execute("update account set balance=balance-1 where id=2;");
    statement2 = connection.createStatement();
    statement2.execute("update account set balance=balance+1 where id=1;");
    connection.commit();
    connection.rollback();
  } catch (Exception e) {
    connection.rollback();
  } finally {
    try {
      statement1.close();
statement2.close();
connection.close();
} catch (SQLException e) {
    e.printStackTrace();
  }
  }
}
