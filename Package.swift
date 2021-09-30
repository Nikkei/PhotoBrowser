// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "PhotoBrowser",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "PhotoBrowser",
            targets: ["PhotoBrowser"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PhotoBrowser",
            dependencies: [],
            resources: [.process("Resources")]),
        .testTarget(
            name: "PhotoBrowserTests",
            dependencies: ["PhotoBrowser"]),
    ]
)
