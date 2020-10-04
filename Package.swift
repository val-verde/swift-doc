// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-doc",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        .executable(name: "swift-doc", targets: ["swift-doc"]),
        .library(name: "SwiftDoc", targets: ["SwiftDoc"])
    ],
    dependencies: [
        .package(name: "SwiftSyntax", url: "https://github.com/val-verde/swift-syntax.git", .branch("val-verde-mainline")),
        .package(url: "https://github.com/val-verde/SwiftSemantics.git", .branch("val-verde-mainline")),
        .package(url: "https://github.com/val-verde/CommonMark.git", .branch("val-verde-mainline")),
        .package(url: "https://github.com/val-verde/SwiftMarkup.git", .branch("val-verde-mainline")),
        .package(url: "https://github.com/SwiftDocOrg/GraphViz.git", .upToNextMinor(from: "0.1.2")),
        .package(url: "https://github.com/NSHipster/HypertextLiteral.git", .upToNextMinor(from: "0.0.2")),
        .package(url: "https://github.com/val-verde/Markup.git", .branch("val-verde-mainline")),
        .package(url: "https://github.com/val-verde/SwiftSyntaxHighlighter.git", .branch("val-verde-mainline")),
        .package(url: "https://github.com/val-verde/swift-argument-parser.git", .branch("val-verde-mainline")),
        .package(url: "https://github.com/val-verde/swift-log.git", .branch("val-verde-android-mainline")),
        .package(name: "LoggingGitHubActions", url: "https://github.com/val-verde/swift-log-github-actions.git", .branch("val-verde-android-mainline")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "swift-doc",
            dependencies: [
                .target(name: "SwiftDoc"),
                .target(name: "DCOV"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "SwiftSemantics", package: "SwiftSemantics"),
                .product(name: "SwiftMarkup", package: "SwiftMarkup"),
                .product(name: "CommonMarkBuilder", package: "CommonMark"),
                .product(name: "HypertextLiteral", package: "HypertextLiteral"),
                .product(name: "Markup", package: "Markup"),
                .product(name: "GraphViz", package: "GraphViz"),
                .product(name: "SwiftSyntaxHighlighter", package: "SwiftSyntaxHighlighter"),
                .product(name: "Logging", package: "swift-log"),
                .product(name: "LoggingGitHubActions", package: "LoggingGitHubActions")
            ]
        ),
        .target(
            name: "DCOV",
            dependencies: []
        ),
        .target(
            name: "SwiftDoc",
            dependencies: [
                .product(name: "SwiftSyntax", package: "SwiftSyntax"),
                .product(name: "SwiftSemantics", package: "SwiftSemantics"),
                .product(name: "SwiftMarkup", package: "SwiftMarkup"),
                .product(name: "SwiftSyntaxHighlighter", package: "SwiftSyntaxHighlighter")
            ]
        ),
        .testTarget(
            name: "SwiftDocTests",
            dependencies: [
                .target(name: "SwiftDoc"),
                .product(name: "SwiftSyntax", package: "SwiftSyntax"),
                .product(name: "SwiftSemantics", package: "SwiftSemantics"),
                .product(name: "SwiftMarkup", package: "SwiftMarkup")
            ]
        ),
        .testTarget(
            name: "EndToEndTests",
            dependencies: [
                .target(name: "swift-doc"),
            ]
        ),
    ]
)
