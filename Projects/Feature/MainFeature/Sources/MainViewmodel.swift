import Foundation

public final class MainViewmodel: ObservableObject {
    @Published var isShowingSearchView: Bool = false
    @Published var searchText: String = ""

    public init() {}

    func updateIsShowingSearchView(isShowing: Bool) {
        isShowingSearchView = isShowing
    }
}
