import Foundation
import NetworkingInterface
import Combine

final class MainViewModel: ObservableObject {
    @Published var isShowingSearchView: Bool = false
    @Published var searchText: String = ""
    @Published var weatherInfo: WeatherEntity?
    @Published var dailyWeatherInfo: [DailyWeatherEntity] = []
    @Published var hourlyWeatherInfo: [HourlyWeatherEntity] = []
    @Published var todayWeatherInfo: DailyWeatherEntity?
    @Published var cityName = "Asan"
    var location: Location = .init(lat: 127.004173, lon: 36.783611)

    private var cancellables = Set<AnyCancellable>()
    private let fetchWeatherUseCase: any FetchWeatherUseCase

    init(
        fetchWeatherUseCase: any FetchWeatherUseCase
    ) {
        self.fetchWeatherUseCase = fetchWeatherUseCase
    }

    func updateIsShowingSearchView(isShowing: Bool) {
        isShowingSearchView = isShowing
    }

    func onAppear() {
        fetchWeatherUseCase(lat: location.lat, lon: location.lon)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("날씨 정보 가져오기 완료")

                case let .failure(failure):
                    print("날씨 정보 가져오시 실패 \(failure.localizedDescription)")
                }
            }, receiveValue: { [weak self] weatherInfo in
                self?.weatherInfo = weatherInfo
            })
            .store(in: &cancellables)
    }

    func updateTodayWeatherInfo(weatherInfo: WeatherEntity) {
        todayWeatherInfo = weatherInfo.dailyWeather.first
    }
}
