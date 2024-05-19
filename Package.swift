// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SenseKit",
    products: [
        .library(name: "SenseKit", targets: ["SenseKit"]),
    ],
    targets: [
        .target(name: "SenseKit"),
        .testTarget(name: "SenseKitTests", dependencies: ["SenseKit"]),
    ],
    swiftLanguageVersions: [.v5]
)
