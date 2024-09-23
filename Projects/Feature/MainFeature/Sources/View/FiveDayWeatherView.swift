import SwiftUI
import NetworkingInterface

struct FiveDayWeatherView: View {
    let weatherList: [DailyWeatherEntity]
    let today = Date()

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("5일간의 일기예보")

            Divider()

            ForEach(weatherList, id: \.dt) { list in
                HStack {
                    dateToWeek(date: Date(timeIntervalSince1970: TimeInterval(list.dt)))

                    Spacer()

                    Text(list.weather.rawValue)

                    Spacer()

                    temperatureRangeItem(
                        minTemp: list.minTemp,
                        maxTemp: list.maxTemp
                    )
                }
                .padding(.vertical, 4)

                Divider()
            }
        }
        .foregroundColor(.white)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.blue)
    }

    @ViewBuilder
    func dateToWeek(date: Date) -> some View {
        if date.isSameDay(as: today) {
            Text("오늘")
        } else {
            let weekday = date.dayOfWeek()
            Text(weekday)
        }
    }

    @ViewBuilder
    func temperatureRangeItem(
        minTemp: Int,
        maxTemp: Int
    ) -> some View {
        HStack(spacing: 16) {
            Text("최소: \(minTemp)°")
                .foregroundColor(.gray)

            Text("최대: \(maxTemp)")
        }
    }
}
