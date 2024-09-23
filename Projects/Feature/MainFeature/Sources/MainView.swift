import SwiftUI
import SearchFeatureInterface
import MainFeatureInterface

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    private let searchBuildable: any SearchBuildable

    init(
        viewModel: MainViewModel,
        searchBuildable: any SearchBuildable
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.searchBuildable = searchBuildable
    }

    public var body: some View {
        NavigationView {
            VStack {
                if let weatherInfo = viewModel.weatherInfo, let todayWeatherInfo = viewModel.todayWeatherInfo {
                    SearchBar(text: $viewModel.searchText)
                        .onTapGesture {
                            viewModel.updateIsShowingSearchView(isShowing: true)
                        }
                    
                    ScrollView {
                        CityWeatherView(
                            cityName: viewModel.cityName,
                            temp: String(format: "%.f", weatherInfo.currentTemp),
                            weather: weatherInfo.currentWeather,
                            minTemp: String(format: "%.f", todayWeatherInfo.minTemp),
                            maxTemp: String(format: "%.f", todayWeatherInfo.maxTemp)
                        )
                        
                        HourlyTempView(tempList: weatherInfo.hourlyWeather.map(\.temp))
                        
                        FiveDayWeatherView(
                            weatherList: weatherInfo.dailyWeather
                        )
                        
                        CityMapView(location: $viewModel.location)
                        
                        HStack {
                            HumidityView(humidity: 56)
                            
                            Spacer()
                            
                            CloudsView(clouds: 50)
                        }
                        
                        WindSpeedView(windSpeed: String(format: "%.2f", 1.97))
                    }
                    .sheet(isPresented: $viewModel.isShowingSearchView) {
                        AnyView(searchBuildable.makeView(selectedCity: { lat,lon,cityName in
                            viewModel.location = .init(lat: lat, lon: lon)
                            viewModel.cityName = cityName
                        }))
                    }
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
}
