// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorRealTime",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "CapacitorRealTime",
            targets: ["CapacitorRealTimePlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0"),
        .package(url: "https://github.com/MobileNativeFoundation/Kronos.git", .upToNextMajor(from: "4.3.1"))
    ],
    targets: [
        .target(
            name: "CapacitorRealTimePlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm"),
                .product(name: "Kronos", package: "Kronos")
            ],
            path: "ios/Sources/CapacitorRealTimePlugin"),
        .testTarget(
            name: "CapacitorRealTimePluginTests",
            dependencies: ["CapacitorRealTimePlugin"],
            path: "ios/Tests/CapacitorRealTimePluginTests")
    ]
)
