import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: .init(
        [
            .package(
                url: "https://github.com/tarikstafford/Networking.git",
                .branch("main")
            ),
            .package(
                url: "https://github.com/tarikstafford/swift-composable-architecture.git",
                .branch("main")
            )
        ],
        deploymentTargets: [.iOS(targetVersion: "13.0", devices: [.iphone])]
    ),
    platforms: [.iOS]
)
