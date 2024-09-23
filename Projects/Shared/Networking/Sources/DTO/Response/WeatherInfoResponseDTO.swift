import Foundation
import NetworkingInterface

public struct WeatherInfoResponseDTO: Decodable {
    public let id: Int
    public let main: String
    public let description: String
    public let icon: WeatherType

    public init(
        id: Int,
        main: String,
        description: String,
        icon: WeatherType
    ) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}

public extension WeatherInfoResponseDTO {
    func toDomain() -> WeatherInfoEntity {
        WeatherInfoEntity(
            id: id,
            main: main,
            description: description,
            icon: icon
        )
    }
}
