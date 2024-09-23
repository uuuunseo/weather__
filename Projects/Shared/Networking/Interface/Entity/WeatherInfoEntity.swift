import Foundation

public struct WeatherInfoEntity: Equatable {
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
