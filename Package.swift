// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "QRCodeScannerCore",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(name: "QRCodeScannerCore", targets: ["QRCodeScannerCore"])
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "QRCodeScannerCore",
            dependencies: []
        )
    ]
)
