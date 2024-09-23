import SwiftUI
import NetworkingInterface
import SearchFeatureInterface

public final class SearchContainer: SearchBuildable {
    private let networkingBuildable: NetworkingBuildable

    public init(networkingBuildable: NetworkingBuildable) {
        self.networkingBuildable = networkingBuildable
    }

    public func makeView() -> some View {
        let fetchCityListUseCase = networkingBuildable.fetchCityListUseCase
        let viewModel = SearchViewModel(fetchCityListUseCase: fetchCityListUseCase)

        return SearchView(viewModel: viewModel)
    }
}
