// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "URLQueryItemCodable",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "URLQueryItemCodable",
            targets: [
                "URLQueryItemCodable"
            ]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "URLQueryItemCodable",
            dependencies: []
        ),
        .testTarget(
            name: "URLQueryItemCodableTests",
            dependencies: [
                "URLQueryItemCodable",
            ]
        ),
    ]
)
