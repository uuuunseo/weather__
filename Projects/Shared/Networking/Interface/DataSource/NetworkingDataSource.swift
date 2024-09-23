import Combine

public protocol NetworkingDataSource {
    func fetchCityList() -> AnyPublisher<[CityInfoEntity], Error>
    func fetchWeather() -> AnyPublisher<WeatherEntity, Error>
}
