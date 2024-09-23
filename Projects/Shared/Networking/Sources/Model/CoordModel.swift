import Foundation
import NetworkingInterface

public struct CoordModel: Codable {
    public let lat: Double
    public let lon: Double

    public init(
        lat: Double,
        lon: Double
    ) {
        self.lat = lat
        self.lon = lon
    }
}

extension CoordModel {
    func toDomain() -> CoordEntity {
        CoordEntity(
            lat: lat,
            lon: lon
        )
    }
}
