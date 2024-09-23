import Combine

public protocol NetworkingRepository {
    func fetchCityList() -> AnyPublisher<[CityInfoEntity], Error>
}
