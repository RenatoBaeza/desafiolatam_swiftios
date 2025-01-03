// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "DataLibrary",
    platforms: [
        .iOS(.v17)
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.1")
    ],
    targets: [
        .target(
            name: "DataLibrary",
            dependencies: ["Alamofire"]
        ),
        .testTarget(
            name: "DataLibraryTests",
            dependencies: ["DataLibrary"]
        )
    ]
) 