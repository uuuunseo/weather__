import SwiftUI

public struct MainView: View {
    @StateObject var viewModel: MainViewmodel

    public init(viewModel: MainViewmodel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        Text("하이")
    }
}
