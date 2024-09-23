import Foundation

public final class MainViewModel: ObservableObject {
    @Published var isShowingSearchView: Bool = false
    @Published var searchText: String = ""

    public init() {}

    func updateIsShowingSearchView(isShowing: Bool) {
        isShowingSearchView = isShowing
    }
}
