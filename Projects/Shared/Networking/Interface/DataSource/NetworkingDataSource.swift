import Combine

public protocol NetworkingDataSource {
    func fetchCityList() -> AnyPublisher<[CityInfoEntity], Error>
    func fetchWeather(lat: Double, lon: Double) -> AnyPublisher<WeatherEntity, Error>
}
