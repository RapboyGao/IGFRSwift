// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GeoMagSwift",

    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "GeoMagSwift",
            targets: ["GeoMagSwift"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-numerics", from: "1.0.3"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "GeoMagSwift",
            dependencies: [
                .product(name: "Numerics", package: "swift-numerics"),
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "GeoMagTests",
            dependencies: ["GeoMagSwift"]
        ),
    ]
)
