// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "aoc",
    products: [
        .executable(name: "aoc", targets: ["AOC"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0")
    ],
    targets: [
        .executableTarget(
            name: "AOC",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        )
    ]
)
