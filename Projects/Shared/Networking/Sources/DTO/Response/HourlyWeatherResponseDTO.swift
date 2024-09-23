import Foundation
import NetworkingInterface

public struct HourlyWeatherResponseDTO: Decodable {
    public let dt: Double
    public let temp: Double
    public let weather: WeatherInfoResponseDTO

    public init(
        dt: Double,
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
