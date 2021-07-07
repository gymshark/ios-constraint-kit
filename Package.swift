// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConstraintKit",
    platforms: [ .iOS(.v12)],
    products: [
        .library(
            name: "ConstraintKit",
            targets: ["ConstraintKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ConstraintKit",
            dependencies: []),
        .testTarget(
            name: "ConstraintKitTests",
            dependencies: ["ConstraintKit"]),
    ]
)
