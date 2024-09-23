import Foundation
import NetworkingInterface

public struct WeatherResponseDTO: Decodable {
    public let current: CurrentWeatherResponseDTO
    public let hourly: [HourlyWeatherResponseDTO]
    public let daily: [DailyWeatherResponseDTO]

    public init(
        current: CurrentWeatherResponseDTO,
        hourly: [HourlyWeatherResponseDTO],
        daily: [DailyWeatherResponseDTO]
    ) {
        self.current = current
        self.hourly = hourly
        self.daily = daily
    }
}

public extension WeatherResponseDTO {
    func toDomain() -> WeatherEntity {
        WeatherEntity(
            currentTemp: current.temp,
            currentWeather: current.weather.description,
            hourlyWeather: hourly.map { $0.toDomain() },
            dailyWeather: daily.map { $0.toDomain() }
        )
    }
}
