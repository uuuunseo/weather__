import Foundation

public enum ModulePaths {
    case feature(Feature)
    case shared(Shared)
}

extension ModulePaths: ModularTargetPathConvertable {
    public func targetName(type: ModularTargetType) -> String {
        switch self {
        case let .feature(module as any ModularTargetPathConvertable),
            let .shared(module as any ModularTargetPathConvertable):
            return module.targetName(type: type)
        }
    }
}

public extension ModulePaths {
    enum Feature: String, ModularTargetPathConvertable {
        case MainFeature
        case SearchFeature
    }
}

public extension ModulePaths {
    enum Shared: String, ModularTargetPathConvertable {
        case Networking
    }
}

public enum ModularTargetType: String {
    case interface = "Interface"
    case sources = ""
    case testing = "Testing"
    case unitTest = "Tests"
    case example = "Example"
}

public protocol ModularTargetPathConvertable {
    func targetName(type: ModularTargetType) -> String
}

public extension ModularTargetPathConvertable where Self: RawRepresentable {
    func targetName(type: ModularTargetType) -> String {
        "\(self.rawValue)\(type.rawValue)"
    }
}

// MARK: - For DI
extension ModulePaths.Feature: CaseIterable {}
extension ModulePaths.Shared: CaseIterable {}
