import Combine
import Foundation
import NetworkingInterface

public final class NetworkingDataSourceImpl: NetworkingDataSource {
    private var cancellables = Set<AnyCancellable>()

    public init() {}

    // Publisher로 반환하기 위해 Combine 사용
    public func fetchCityList() -> AnyPublisher<[CityInfoEntity], Error> {
        guard let url = URL(string: "https://file.notion.so/f/f/f6c316f2-89b6-4eab-be32-8565c5f11bf4/12485f38-6bea-43ed-bcf0-de687fdc4d6e/citylist.json?table=block&id=396114f6-fba4-4e74-ae1d-cab3a1a1fa2b&spaceId=f6c316f2-89b6-4eab-be32-8565c5f11bf4&expirationTimestamp=1727143200000&signature=jfypxQYUWye6B0A9YNZi0LJmwYbxKrQwdvLv2iXjySI&downloadName=citylist.json") else {
            print("잘못된 URL입니다.")
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [CityInfoModel].self, decoder: JSONDecoder())
            .map { cityList in
                return cityList.map { $0.toDomain() }
            }
            .eraseToAnyPublisher()
    }
}
