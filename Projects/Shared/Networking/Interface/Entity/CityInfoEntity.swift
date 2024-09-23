public struct CityInfoEntity: Equatable {
    public let id: Int
    public let name: String
    public let country: String
    public let coord: CoordEntity

    public init(
        id: Int,
        name: String,
        country: String,
        coord: CoordEntity
    ) {
        self.id = id
        self.name = name
        self.country = country
        self.coord = coord
    }
}
