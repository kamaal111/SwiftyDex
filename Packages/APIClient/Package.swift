// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "APIClient",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "APIClient",
            targets: ["APIClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/kamaal111/XiphiasNet.git", "7.0.0" ..< "8.0.0"),
        .package(path: "../ClientKit"),
    ],
    targets: [
        .target(
            name: "APIClient",
            dependencies: [
                "XiphiasNet",
                "ClientKit",
            ]
        ),
        .testTarget(
            name: "APIClientTests",
            dependencies: ["APIClient"]
        ),
    ]
)
