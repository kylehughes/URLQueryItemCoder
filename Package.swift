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
                "URLQueryItemDecoder",
                "URLQueryItemEncoder",
            ]
        ),
        .library(
            name: "URLQueryItemDecoder",
            targets: [
                "URLQueryItemDecoder",
            ]
        ),
        .library(
            name: "URLQueryItemEncoder",
            targets: [
                "URLQueryItemEncoder",
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
            dependencies: [
                "Common",
            ]
        ),
        .target(
            name: "URLQueryItemDecoder",
            dependencies: [
                "Common",
            ]
        ),
        .target(
            name: "URLQueryItemEncoder",
            dependencies: [
                "Common",
            ]
        ),
        .testTarget(
            name: "EndToEndTests",
            dependencies: [
                "TestSupport",
                "URLQueryItemDecoder",
                "URLQueryItemEncoder",
            ]
        ),
        .testTarget(
            name: "URLQueryItemDecoderTests",
            dependencies: [
                "TestSupport",
                "URLQueryItemDecoder",
            ]
        ),
        .testTarget(
            name: "URLQueryItemEncoderTests",
            dependencies: [
                "TestSupport",
                "URLQueryItemEncoder",
            ]
        ),
    ]
)
