import SwiftUI

public protocol MainBuildable {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
