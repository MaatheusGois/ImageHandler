// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ImageHandler",
    products: [
        .library(
            name: "ImageHandler",
            targets: ["ImageHandler"]),
    ],
    targets: [
        .target(
            name: "ImageHandler",
            dependencies: [],
            exclude: [
                "public"
            ]
        ),
        .testTarget(
            name: "ImageHandlerTests",
            dependencies: ["ImageHandler"],
            exclude: [
                "public"
            ]
        )
    ]
)
