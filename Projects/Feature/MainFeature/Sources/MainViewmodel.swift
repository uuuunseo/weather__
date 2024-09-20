import Foundation

public final class MainViewmodel: ObservableObject {
    @Published var searchText: String = ""

    public init() {}
}
