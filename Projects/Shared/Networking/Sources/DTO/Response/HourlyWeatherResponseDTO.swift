import Foundation
import NetworkingInterface

public struct HourlyWeatherResponseDTO: Decodable {
    public let dt: Int
    public let temp: Double
    public let weather: WeatherInfoResponseDTO

    public init(
        dt: Int,
        temp: Double,
        weather: WeatherInfoResponseDTO
    ) {
        self.dt = dt
        self.temp = temp
        self.weather = weather
    }
}

public extension HourlyWeatherResponseDTO {
    func toDomain() -> HourlyWeatherEntity {
        HourlyWeatherEntity(
            dt: dt,
            temp: temp,
            weather: weather.toDomain()
        )
    }
}
