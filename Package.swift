// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "URLQueryItemCodable",
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
