import Foundation

public struct WeatherEntity: Equatable {
    public let currentTemp: Double
    public let currentWeather: String
    public let hourlyWeather: [HourlyWeatherEntity]
    public let dailyWeather: [DailyWeatherEntity]

    public init(
        currentTemp: Double,
        currentWeather: String,
        hourlyWeather: [HourlyWeatherEntity],
        dailyWeather: [DailyWeatherEntity]
    ) {
        self.currentTemp = currentTemp
        self.currentWeather = currentWeather
        self.hourlyWeather = hourlyWeather
        self.dailyWeather = dailyWeather
    }
}


public struct HourlyWeatherEntity: Equatable {
    public let dt: Double
    public let temp: Double
    public let weather: WeatherInfoEntity

    public init(
        dt: Double,
        temp: Double,
        weather: WeatherInfoEntity
    ) {
        self.dt = dt
        self.temp = temp
        self.weather = weather
    }
}

public struct DailyWeatherEntity: Equatable {
    public let dt: Double
    public let minTemp: Double
    public let maxTemp: Double
    public let humidity: Int
    public let windSpeed: Double
    public let weather: WeatherInfoEntity
    public let clouds: Int

    public init(
        dt: Double,
        minTemp: Double,
        maxTemp: Double,
        humidity: Int,
        windSpeed: Double,
        weather: WeatherInfoEntity,
        clouds: Int
    ) {
        self.dt = dt
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.weather = weather
        self.clouds = clouds
    }
}
