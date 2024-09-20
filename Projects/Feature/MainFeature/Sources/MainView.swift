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
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
}
