import ProjectDescription

let dependencies = Dependencies(swiftPackageManager: [
    .remote(
        url: "https://github.com/tarikstafford/Networking.git",
        requirement: .branch("main")
    ),
    .remote(
        url: "https://github.com/pointfreeco/swift-composable-architecture.git",
        requirement: .upToNextMajor(from: "0.30.0")
    )
], platforms: Set(arrayLiteral: .iOS))
