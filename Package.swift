// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WireGuardKit",
    platforms: [
        .macOS(.v14),
        .iOS(.v15)
    ],
    products: [
        .library(name: "WireGuardKit", targets: ["WireGuardKit"]),
        // --- NEW PRODUCT: Expose all your shared utilities and logger ---
        .library(name: "WireGuardUtilities", targets: ["WireGuardUtilities"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WireGuardKit",
            dependencies: ["WireGuardKitGo", "WireGuardKitC"]
        ),
        .target(
            name: "WireGuardKitC",
            dependencies: [],
            publicHeadersPath: "."
        ),
        .target(
            name: "WireGuardKitGo",
            dependencies: [],
            exclude: [
                "goruntime-boottime-over-monotonic.diff",
                "go.mod",
                "go.sum",
                "api-apple.go",
                "Makefile"
            ],
            publicHeadersPath: ".",
            linkerSettings: [.linkedLibrary("wg-go")]
        ),
          // --- NEW TARGET: RingLoggerC (for ringlogger.c and ringlogger.h) ---
        // This target compiles the C logging code.
        .target(
            name: "RingLoggerC",
            dependencies: [],
            path: "Sources/Shared/Logging", // Path directly to the Logging folder within Shared
            sources: ["ringlogger.c"], // Specify the C source file
            publicHeadersPath: "." // Expose ringlogger.h
        ),
        // --- NEW TARGET: WireGuardUtilities (for all Swift files in Shared) ---
        // This target compiles all the Swift files from Logging and Model subfolders.
        .target(
            name: "WireGuardUtilities",
            dependencies: [
                "WireGuardKit", // These Swift files likely need access to WireGuardKit types
                "RingLoggerC"   // Logger.swift needs the C functions from RingLoggerC
            ],
            path: "Sources/Shared", // Set the base path to the Shared folder
            sources: [
                "Logging/Logger.swift", // Path relative to "Sources/Shared"
                "Model/TunnelConfiguration+WgQuickConfig.swift",
                "Model/NETunnelProviderProtocol+Extension.swift",
                "Model/String+ArrayConversion.swift",                
                "FileManager+Extension.swift",
                "Keychain.swift",
                "NotificationToken.swift"
            ],
            // This flag is recommended as these files (especially NETunnelProviderProtocol+Extension)
            // are intended for a Network Extension context.
            swiftSettings: [.define("NETWORK_EXTENSION")]
        )
    ]
)
