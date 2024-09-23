import Combine

public protocol FetchCityListUseCase {
    func callAsFunction() -> AnyPublisher<[CityInfoEntity], Error>
}
