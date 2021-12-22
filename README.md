# Comixforlife project

![Swift v5.5](https://img.shields.io/badge/swift-v5.3-orange.svg)
![platforms iOS](https://img.shields.io/badge/platforms-iOS-blue.svg)
![test coverage 0%](https://img.shields.io/badge/test%20coverage-0%25-success.svg)

## 📝 Description

1. I spent most of my time setting up the architecture of the project so there is only view as of now. I will probably add more stuff in later. But the main point was to make it modular not pretty. The internal functionality is the easiest part :)
2. This project uses `tuist` so to setup the project you will need to follow these steps.

  - Install tuist -> bash <(curl -Ls https://install.tuist.io)
  - run command `tuist dependencies fetch`
  - run command `tuist generate --open`

3. This project uses Composable Architecture and a super basic Networking library that I built to work with it.

## 🛠 Tech stack

- [Xcode](https://developer.apple.com/xcode/) v13.1
- [Swift](https://swift.org/) v5.5
- [iOS](https://www.apple.com/pl/ios/) v15.0
- [ComposableArchitecture](https://github.com/pointfreeco/swift-composable-architecture) v0.20.0
