import NetworkingInterface
import Combine

public struct FetchWeatherUseCaseImpl: FetchWeatherUseCase {
    private let networkingRepository: NetworkingRepository

    public init(networkingRepository: NetworkingRepository) {
        self.networkingRepository = networkingRepository
    }

    public func callAsFunction() -> AnyPublisher<WeatherEntity, any Error> {
        networkingRepository.fetchWeather()
    }
}
