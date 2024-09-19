import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.module(
    name: ModulePaths.Feature.SearchFeature.rawValue,
    targets: [
        .interface(module: .feature(.SearchFeature), dependencies: []),
        .implements(module: .feature(.SearchFeature), dependencies: []),
        .tests(module: .feature(.SearchFeature), dependencies: [])
    ]
)
