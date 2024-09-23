import SwiftUI
import MainFeatureInterface

public struct SearchView: View {
    @StateObject var viewModel: SearchViewModel

    public init(viewModel: SearchViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if viewModel.isLoading {
                ProgressView()
            } else {
                SearchBar(text: $viewModel.searchText)
                    .padding(.top, 24)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 4) {
                        Spacer()
                        
                        ForEach(viewModel.cityList, id: \.id) { city in
                            Text(city.name)
                            
                            Text(city.country)
                                .font(.caption)

                            Divider()
                        }
                        
                    }
                }
                .padding(.horizontal, 4)
            }
        }
        .padding(.horizontal)
        .onAppear { viewModel.onAppear() }
        .onChange(of: viewModel.searchText) { newValue in
            viewModel.updateCityList(searchText: newValue)
        }
    }
}
