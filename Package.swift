import PackageDescription

let package = Package(
  name: "Rezz",
  targets: [Target(name: "Rezz",
                   dependencies: [.Target(name: "CRezz")])]
)
