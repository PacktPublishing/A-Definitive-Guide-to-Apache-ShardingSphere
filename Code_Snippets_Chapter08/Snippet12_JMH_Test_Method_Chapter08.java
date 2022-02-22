@Setup(Level.Trial)
public void setup() throws Exception {
    connection = getConnection();
    for (int i = 0; i < preparedStatements.length; i++) {
        preparedStatements[i] = connection.prepareStatement(String.format("select c from sbtest%d where id = ?", i + 1));
    }
}

@Benchmark
public void oltpPointSelect() throws Exception {
    for (PreparedStatement each : preparedStatements) {
        each.setInt(1, ThreadLocalRandom.current().nextInt(BenchmarkParameters.TABLE_SIZE));
        each.execute();
    }
}

@TearDown(Level.Trial)
public void tearDown() throws Exception {
    for (PreparedStatement each : preparedStatements) {
        each.close();
    }
    connection.close();
}
