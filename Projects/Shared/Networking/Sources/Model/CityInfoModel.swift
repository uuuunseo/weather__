import Foundation
import NetworkingInterface

public struct CityInfoModel: Codable {
    public let id: Int
    public let name: String
    public let country: String
    public let coord: CoordModel

    public init(
        id: Int,
        name: String,
        country: String,
        coord: CoordModel
    ) {
        self.id = id
        self.name = name
        self.country = country
        self.coord = coord
    }
}

public extension CityInfoModel {
    func toDomain() -> CityInfoEntity {
        CityInfoEntity(
            id: id,
            name: name,
            country: country,
            coord: coord.toDomain()
        )
    }
}
