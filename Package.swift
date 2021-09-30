// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "PhotoBrowser",
    platforms: [
        .iOS(.v11)
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
            dependencies: []),
        .testTarget(
            name: "PhotoBrowserTests",
            dependencies: ["PhotoBrowser"]),
    ]
)
