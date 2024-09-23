public protocol NetworkingBuildable {
    var fetchCityListUseCase: any FetchCityListUseCase { get }
    var networkingRepository: any NetworkingRepository { get }
}
