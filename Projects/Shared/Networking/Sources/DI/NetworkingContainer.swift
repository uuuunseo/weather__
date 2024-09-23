import NetworkingInterface

public final class NetworkingContainer: NetworkingBuildable {
    private let networkingDataSource: NetworkingDataSource = NetworkingDataSourceImpl()
    public init() {}

    public var fetchCityListUseCase: any FetchCityListUseCase {
        FetchCityListUseCaseImpl(networkingRepository: networkingRepository)
    }

    public var networkingRepository: any NetworkingRepository {
        NetworkingRepositoryImpl(networkingDataSource: networkingDataSource)
    }
}
