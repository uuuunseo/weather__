import SwiftUI

public protocol SearchBuildable {
    associatedtype SomeView: View
    func makeView(selectedCity: (
        _ lat: Double,
        _ lon: Double,
        _ cityName: String
    ) -> Void) -> SomeView
}
