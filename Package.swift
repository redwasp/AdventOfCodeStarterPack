// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Position",
    products: [
        .library(
            name: "Position",
            targets: ["Position"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Position",
            dependencies: []
        ),
        .testTarget(
            name: "PositionTests",
            dependencies: ["Position"]
        ),
    ]
)
