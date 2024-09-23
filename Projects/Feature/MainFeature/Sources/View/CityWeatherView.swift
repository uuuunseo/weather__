import SwiftUI

struct CityWeatherView: View {
    let cityName: String
    let temp: String
    let weather: String
    let minTemp: String
    let maxTemp: String

    var body: some View {
        VStack(spacing: 20) {
            Text(cityName)
                .font(.system(size: 30, weight: .light))

            Text("\(temp)°")
                .font(.system(size: 80, weight: .medium))

            VStack(spacing: 10) {
                Text(weather)

                HStack {
                    Text("최고:")

                    Text("\(maxTemp)°")

                    Divider()

                    Text("최저:")

                    Text("\(minTemp)°")
                }
            }
        }
    }
}
