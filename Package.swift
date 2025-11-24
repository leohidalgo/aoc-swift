// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "aoc",
    platforms: [.macOS(.v15)],
    products: [
        .executable(
            name: "aoc",
            targets: ["AOC"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.6.2"),
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.62.2")
    ],
    targets: [
        .target(name: "AOC2024", dependencies: ["AOCCore"]),
        .target(name: "AOC2025", dependencies: ["AOCCore"]),
        .target(name: "AOCCore"),
        .testTarget(
            name: "AOCTests",
            dependencies: [
                "AOC2024",
                "AOC2025"
            ]
        ),
        .executableTarget(
            name: "AOC",
            dependencies: [
                "AOC2024",
                "AOC2025",
                "AOCCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        )
    ]
)
