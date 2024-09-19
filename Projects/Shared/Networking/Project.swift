import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.module(
    name: ModulePaths.Shared.Networking.rawValue,
    targets: [
        .interface(module: .shared(.Networking), dependencies: []),
        .implements(module: .shared(.Networking), dependencies: []),
        .tests(module: .shared(.Networking), dependencies: [])
    ]
)
