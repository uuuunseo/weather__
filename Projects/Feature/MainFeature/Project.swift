import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.module(
    name: ModulePaths.Feature.MainFeature.rawValue,
    targets: [
        .interface(module: .feature(.MainFeature), dependencies: []),
        .implements(module: .feature(.MainFeature), dependencies: []),
        .tests(module: .feature(.MainFeature), dependencies: [])
    ]
)
