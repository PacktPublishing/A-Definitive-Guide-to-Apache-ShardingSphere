public final class ModeConfigurationCreator {

    public static ModeConfiguration create() {
        ClusterPersistRepositoryConfiguration clusterPersistRepositoryConfiguration = new ClusterPersistRepositoryConfiguration("ZooKeeper", "governance", "127.0.0.1", new Properties());
        return new ModeConfiguration("Cluster", clusterPersistRepositoryConfiguration, true);
    }
}
