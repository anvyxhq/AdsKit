// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AdsKit",
    platforms: [
        .iOS("26.0")
    ],
    products: [
        .library(name: "AdsCore", targets: ["AdsCore"]),
    ],
    targets: [
        .target(name: "AdsCore"),
        .testTarget(name: "AdsCoreTests", dependencies: ["AdsCore"]),
    ]
)
