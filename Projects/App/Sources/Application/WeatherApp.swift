import SwiftUI
import MainFeature

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewmodel())
        }
    }
}
