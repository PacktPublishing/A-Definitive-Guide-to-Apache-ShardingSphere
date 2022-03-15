// Standalone Mode

private ModeConfiguration getModeConfiguration(final ShardingType shardingType) {
    StandalonePersistRepositoryConfiguration standaloneConfig = new StandalonePersistRepositoryConfiguration("File", new Properties());
    return new ModeConfiguration("Standalone", standaloneConfig, true);
}

// Cluster Mode

private ModeConfiguration getModeConfiguration(final ShardingType shardingType) {
    ClusterPersistRepositoryConfiguration clusterPersistRepositoryConfiguration = new ClusterPersistRepositoryConfiguration("ZooKeeper", "governance", "127.0.0.1", new Properties());
    return new ModeConfiguration("Cluster", clusterPersistRepositoryConfiguration, true);
}
