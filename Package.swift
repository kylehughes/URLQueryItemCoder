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
                "URLQueryItemDecodable",
                "URLQueryItemEncodable",
            ]
        ),
        .library(
            name: "URLQueryItemDecodable",
            targets: [
                "URLQueryItemDecodable",
            ]
        ),
        .library(
            name: "URLQueryItemEncodable",
            targets: [
                "URLQueryItemEncodable",
            ]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Common",
            dependencies: []
        ),
        .target(
            name: "TestSupport",
            dependencies: []
        ),
        .target(
            name: "URLQueryItemDecodable",
            dependencies: [
                "Common",
            ]
        ),
        .target(
            name: "URLQueryItemEncodable",
            dependencies: [
                "Common",
            ]
        ),
        .testTarget(
            name: "URLQueryItemDecodableTests",
            dependencies: [
                "TestSupport",
                "URLQueryItemDecodable",
            ]
        ),
        .testTarget(
            name: "URLQueryItemEncodableTests",
            dependencies: [
                "TestSupport",
                "URLQueryItemEncodable",
            ]
        ),
    ]
)
