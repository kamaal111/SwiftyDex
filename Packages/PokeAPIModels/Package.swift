// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PokeAPIModels",
    products: [
        .library(
            name: "PokeAPIModels",
            targets: ["PokeAPIModels"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PokeAPIModels",
            dependencies: []
        ),
        .testTarget(
            name: "PokeAPIModelsTests",
            dependencies: ["PokeAPIModels"]
        ),
    ]
)
