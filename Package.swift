// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "AtomicValue",
    products: [
        .library(
            name: "AtomicValue",
            targets: ["AtomicValue"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "AtomicValue",
            dependencies: []),
        .testTarget(
            name: "AtomicValueTests",
            dependencies: []),
    ]
)
