import SwiftUI
import MainFeatureInterface
import MainFeature
import SearchFeature
import Networking

@main
struct WeatherApp: App {
    let mainBuildable: any MainBuildable

    init() {
        let networkingBuilder = NetworkingContainer()
            let searchBuildable = SearchContainer(networkingBuildable: networkingBuilder)
            self.mainBuildable = MainContainer(searchBuildable: searchBuildable)
        }

    var body: some Scene {
        WindowGroup {
            AnyView(mainBuildable.makeView())
        }
    }
}
