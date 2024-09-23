import Combine

public protocol NetworkingRepository {
    func fetchCityList() -> AnyPublisher<[CityInfoEntity], Error>
    func fetchWeather(lat: Double, lon: Double) -> AnyPublisher<WeatherEntity, Error>
}
