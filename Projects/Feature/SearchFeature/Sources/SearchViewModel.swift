import Foundation
import NetworkingInterface
import Combine

public final class SearchViewModel: ObservableObject {
    @Published var cityList: [CityInfoEntity] = []
    @Published var isLoading = false
    @Published var searchText: String = ""
    var defaultCityList: [CityInfoEntity] = []
    var selectedCity: (
        _ lat: Double,
        _ lon: Double,
        _ cityName: String
    ) -> Void

    private var cancellables = Set<AnyCancellable>()
    private let fetchCityListUseCase: any FetchCityListUseCase

    public init(
        fetchCityListUseCase: any FetchCityListUseCase,
        selectedCity: @escaping (
            _ lat: Double,
            _ lon: Double,
            _ cityName: String
        ) -> Void
    ) {
        self.fetchCityListUseCase = fetchCityListUseCase
        self.selectedCity = selectedCity
    }

    @MainActor
    func onAppear() {
        isLoading = true
        fetchCityListUseCase()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("도시 리스트 로드 완료")
                case let .failure(failure):
                    print("도시 리스트 로드 실패 \(failure.localizedDescription)")
                }
            }, receiveValue: { [weak self] cityList in
                self?.defaultCityList = cityList
                self?.updateCityList(searchText: "")
                self?.isLoading = false
            })
            .store(in: &cancellables)
    }

    @MainActor 
    func updateCityList(searchText: String) {
        guard searchText != "" else { return cityList = defaultCityList }
        self.cityList = cityList.filter { $0.name.contains(searchText) }
    }
}
