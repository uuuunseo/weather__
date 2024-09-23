import Foundation

public struct CurrentWeatherResponseDTO: Decodable {
    public let temp: Double
    public let weather: [WeatherInfoResponseDTO]

    public init(
        temp: Double,
        weather: [WeatherInfoResponseDTO]
    ) {
        self.temp = temp
        self.weather = weather
    }
}
