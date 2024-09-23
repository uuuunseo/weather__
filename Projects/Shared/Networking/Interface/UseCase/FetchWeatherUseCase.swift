import Combine

public protocol FetchWeatherUseCase {
    func callAsFunction() -> AnyPublisher<WeatherEntity, Error>
}
