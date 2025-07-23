// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "YandexBrowserInstaller",
    platforms: [
        .macOS(.v10_13)
    ],
    targets: [
        .target(
            name: "YandexBrowserInstaller",
            dependencies: []
        )
    ]
) 