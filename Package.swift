// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "Shukarr",
    platforms: [
        .macOS(.v14),
    ],
    targets: [
        .executableTarget(
            name: "Shukarr",
            path: "Sources/Shukarr",
            resources: [
                .process("Resources"),
            ])
    ]
)
