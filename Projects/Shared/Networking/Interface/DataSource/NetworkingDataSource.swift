import Combine

public protocol NetworkingDataSource {
    func fetchCityList() -> AnyPublisher<[CityInfoEntity], Error>
}
