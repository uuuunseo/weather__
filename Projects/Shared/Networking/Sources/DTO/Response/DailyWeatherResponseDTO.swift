import Foundation
import NetworkingInterface

public struct DailyWeatherResponseDTO: Decodable {
    public let dt: Double
    public let temp: TempResponseDTO
    public let humidity: Int
    public let windSpeed: Double
    public let weather: WeatherInfoResponseDTO
    public let clouds: Int

    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case humidity
        case windSpeed = "wind_speed"
        case weather
        case clouds
    }
}

public struct TempResponseDTO: Decodable {
    public let min: Double
    public let max: Double

    public init(min: Double, max: Double) {
        self.min = min
        self.max = max
    }
}

public extension DailyWeatherResponseDTO {
    func toDomain() -> DailyWeatherEntity {
        DailyWeatherEntity(
            dt: dt,
            minTemp: temp.min,
            maxTemp: temp.max,
            humidity: humidity,
            windSpeed: windSpeed,
            weather: weather.toDomain(),
            clouds: clouds
        )
    }
}
