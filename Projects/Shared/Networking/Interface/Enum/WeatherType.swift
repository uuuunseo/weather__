import Foundation

public enum WeatherType: String, Decodable {
    case sunny = "01d"
    case partlyCloudy = "02d"
    case mostlyCloudy = "03d"
    case cloudy = "04d"
    case rainy = "09d"
    case shower = "10d"
    case thunderstorm = "11d"
    case snowing = "13d"
    case misty = "50d"
}
