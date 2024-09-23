import Combine

public protocol FetchWeatherUseCase {
    func callAsFunction(lat: Double, lon: Double) -> AnyPublisher<WeatherEntity, Error>
}
