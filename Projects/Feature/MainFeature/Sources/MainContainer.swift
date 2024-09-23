import SwiftUI
import NetworkingInterface
import MainFeatureInterface
import SearchFeatureInterface

public final class MainContainer: MainBuildable {
    private let searchBuildable: any SearchBuildable

    public init(searchBuildable: any SearchBuildable) {
        self.searchBuildable = searchBuildable
    }

    public func makeView() -> some View {
        MainView(
            viewModel: .init(),
            searchBuildable: searchBuildable
        )
    }
}
