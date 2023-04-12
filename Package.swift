// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "URLQueryItemCoder",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "URLQueryItemCoder",
            targets: [
                "URLQueryItemCoder",
            ]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "URLQueryItemCoder",
            dependencies: []
        ),
        .testTarget(
            name: "URLQueryItemCoderTests",
            dependencies: [
                "URLQueryItemCoder",
            ]
        ),
    ]
)
