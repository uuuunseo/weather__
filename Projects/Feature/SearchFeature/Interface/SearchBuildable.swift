import SwiftUI

public protocol SearchBuildable {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
