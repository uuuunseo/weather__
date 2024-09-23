import Combine

public protocol NetworkingRepository {
    func fetchCityList() -> AnyPublisher<[CityInfoEntity], Error>
    func fetchWeather() -> AnyPublisher<WeatherEntity, Error>
}
