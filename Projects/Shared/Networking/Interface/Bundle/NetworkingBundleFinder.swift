import Foundation

public class NetworkingBundleFinder {}

public extension Foundation.Bundle {
    static let networking = Bundle(for: NetworkingBundleFinder.self)
}
