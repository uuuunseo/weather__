import Foundation
import NetworkingInterface
import Combine

public struct FetchCityListUseCaseImpl: FetchCityListUseCase {
    private let networkingRepository: NetworkingRepository

    public init(networkingRepository: NetworkingRepository) {
        self.networkingRepository = networkingRepository
    }

    public func callAsFunction() -> AnyPublisher<[CityInfoEntity], Error> {
        networkingRepository.fetchCityList()
    }
}
