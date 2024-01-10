// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCodeStarterPack",
    products: [
        .library(
            name: "AdventOfCodeStarterPack",
            targets: ["AdventOfCodeStarterPack"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "AdventOfCodeStarterPack",
            dependencies: []
        ),
        .testTarget(
            name: "AdventOfCodeStarterPackTests",
            dependencies: ["AdventOfCodeStarterPack"]
        ),
    ]
)
