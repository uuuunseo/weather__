import SwiftUI

public struct MainView: View {
    @StateObject var viewModel: MainViewmodel

    public init(viewModel: MainViewmodel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)

                ScrollView {
                    CityWeatherView(
                        cityName: "seoul",
                        temp: -7,
                        weather: "맑음",
                        minTemp: -11,
                        maxTemp: -1
                    )
                    
                    HourlyTempView(tempList: [1, 3, 5, 3, 6, 7,6,7,89,9,0,7,5,34,3,6,7,9,9,6,43,6,7,8])
                }
            }
        }
        .padding(.horizontal)
    }
}
