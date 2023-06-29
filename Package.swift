// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "MapboxDirections",
    platforms: [
        .macOS(.v10_14), .iOS(.v12), .watchOS(.v5), .tvOS(.v12)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "MapboxDirections",
            targets: ["MapboxDirections"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", from: "6.0.0"),
		.package(url: "https://github.com/raphaelmor/Polyline.git", revision: "v5.1.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "MapboxDirections",
            dependencies: [
                .product(name: "Polyline", package: "Polyline")
            ]
            exclude: [
                "Info.plist",
                "MBAttribute.h",
				"MBLaneIndication.h",
				"MBRoadClasses.h",
				"MBRouteOptions.h",
				"MBRouteOptions.m",
                "MBPlacemarkPrecision.m",
                "MBPlacemarkScope.h",
            ]),
        .testTarget(
            name: "MapboxDirectionsTests",
            dependencies: [
                "MapboxDirections",
                .product(name: "OHHTTPStubsSwift", package: "OHHTTPStubs"),
				.product(name: "Polyline", package: "Polyline"),
            ],
            exclude: [
                "Info.plist",
            ],
            resources: [
                .process("Fixtures"),
            ]),
    ]
)
