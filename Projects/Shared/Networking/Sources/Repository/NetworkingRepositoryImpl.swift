import NetworkingInterface
import Foundation
import Combine

public struct NetworkingRepositoryImpl: NetworkingRepository {
    private let networkingDataSource: NetworkingDataSource

    public init(networkingDataSource: NetworkingDataSource) {
        self.networkingDataSource = networkingDataSource
    }

    public func fetchCityList() -> AnyPublisher<[CityInfoEntity], Error> {
        networkingDataSource.fetchCityList()
    }

    public func fetchWeather() -> AnyPublisher<WeatherEntity, any Error> {
        networkingDataSource.fetchWeather()
    }
}
