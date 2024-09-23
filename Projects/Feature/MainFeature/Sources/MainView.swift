import SwiftUI
import SearchFeatureInterface
import MainFeatureInterface

public struct MainView: View {
    @StateObject var viewModel: MainViewModel
    private let searchBuildable: any SearchBuildable

    public init(
        viewModel: MainViewModel,
        searchBuildable: any SearchBuildable
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.searchBuildable = searchBuildable
    }

    public var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
                    .onTapGesture {
                        viewModel.updateIsShowingSearchView(isShowing: true)
                    }

                ScrollView {
                    CityWeatherView(
                        cityName: "seoul",
                        temp: -7,
                        weather: "맑음",
                        minTemp: -11,
                        maxTemp: -1
                    )
                    
                    HourlyTempView(tempList: [1, 3, 5, 3, 6, 7,6,7,89,9,0,7,5,34,3,6,7,9,9,6,43,6,7,8])

                    FiveDayWeatherView(
                        weatherList: [.init(
                            date: Date(),
                            weather: .misty,
                            minTemp: 4,
                            maxTemp: 5
                        )]
                    )

                    CityMapView(
                        location: Binding(
                            get: { .init(lat: 36.783611, lon: 127.004173) },
                            set: { location in print(location) }
                        )
                    )

                    HStack {
                        HumidityView(humidity: 56)

                        Spacer()

                        CloudsView(clouds: 50)
                    }

                    WindSpeedView(windSpeed: String(format: "%.2f", 1.97))
                }
                .sheet(isPresented: $viewModel.isShowingSearchView) {
                    AnyView(searchBuildable.makeView())
                }

                Spacer()
            }
        }
        .padding(.horizontal)
    }
}
