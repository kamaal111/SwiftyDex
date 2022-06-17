// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClientKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ClientKit",
            targets: ["ClientKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kamaal111/XiphiasNet.git", "7.0.0" ..< "8.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ClientKit",
            dependencies: [
                "XiphiasNet",
            ]),
        .testTarget(
            name: "ClientKitTests",
            dependencies: ["ClientKit"]),
    ]
)
