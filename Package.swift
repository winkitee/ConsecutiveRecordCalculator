// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConsecutiveRecordCalculator",
    products: [
        .library(
            name: "ConsecutiveRecordCalculator",
            targets: ["ConsecutiveRecordCalculator"]),
    ],
    targets: [
        .target(
            name: "ConsecutiveRecordCalculator"),
        .testTarget(
            name: "ConsecutiveRecordCalculatorTests",
            dependencies: ["ConsecutiveRecordCalculator"]),
    ]
)
