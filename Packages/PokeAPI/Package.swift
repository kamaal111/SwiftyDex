// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PokeAPI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "PokeAPI",
            targets: ["PokeAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kamaal111/XiphiasNet.git", "7.0.0" ..< "8.0.0"),
    ],
    targets: [
        .target(
            name: "PokeAPI",
            dependencies: [
                "XiphiasNet",
            ]),
        .testTarget(
            name: "PokeAPITests",
            dependencies: ["PokeAPI"]),
    ]
)
