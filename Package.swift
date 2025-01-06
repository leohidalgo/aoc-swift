// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "aoc",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .executable(name: "aoc", targets: ["AOC"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0")
    ],
    targets: [
        .target(name: "AOC2024", dependencies: ["AOCCore"]),
        .target(name: "AOCCore"),

        .testTarget(name: "AOC2024Tests", dependencies: ["AOC2024"]),

        .executableTarget(
            name: "AOC",
            dependencies: [
                "AOC2024",
                "AOCCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        )
    ]
)
