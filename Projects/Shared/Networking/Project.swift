import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.module(
    name: ModulePaths.Shared.Networking.rawValue,
    targets: [
        .interface(module: .shared(.Networking), dependencies: []),
        .implements(module: .shared(.Networking), dependencies: [
            .shared(target: .Networking, type: .interface)
        ]),
        .tests(module: .shared(.Networking), dependencies: [])
    ]
)
