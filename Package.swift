// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.


// MARK: Import section

import PackageDescription



// MARK: - Package

let package = Package(
    name: "BuddyUI",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "BuddyUI",
            targets: ["BuddyUI"]
        )
    ],
    targets: [
        .target(name: "BuddyUI")
    ],
    swiftLanguageModes: [.v6]
)
