# FutTrack

<!-- Logo placeholder -->
<!-- ![FutTrack Logo](docs/assets/logo.png) -->

<!-- Badges placeholders -->
<!-- ![CI](https://github.com/rudrigaum/FutTrack/actions/workflows/ci.yml/badge.svg) -->
<!-- ![Coverage](https://codecov.io/gh/rudrigaum/FutTrack/branch/main/graph/badge.svg) -->
<!-- ![License](https://img.shields.io/github/license/rudrigaum/FutTrack) -->

> Amateur football league management — standings, fixtures, and player stats, right in your pocket.

---

## Overview

**FutTrack** is an iOS application designed to help organizers and players manage amateur football leagues. It provides:

- 📊 **Standings & Classification** — real-time league tables with points, wins, draws, losses, and goal difference
- 📅 **Fixtures** — schedule and results for every match in the league
- 🏅 **Player Statistics** — goals, assists, yellow/red cards, and more
- 🏆 **League Organization** — manage multiple leagues and seasons in one place

The project is planned to expand to Android and Web platforms in future releases.

---

## Tech Stack

| Area | Technology |
|---|---|
| Platform | iOS 17+ |
| Language | Swift 5.9+ |
| UI | UIKit — 100% View Code (no storyboards) |
| Architecture | Clean Architecture + MVVM-C |
| Reactive | Combine (binding only) |
| Concurrency | async/await |
| Linting | SwiftLint |
| Minimum Xcode | Xcode 15+ |

---

## Architecture

FutTrack follows **Clean Architecture** combined with the **MVVM-C** (Model-View-ViewModel-Coordinator) pattern, organized into three main layers:

```
FutTrack/
├── Domain/
│   ├── Entities/          # Pure business models
│   └── UseCases/          # Business rules & interactors
│
├── Data/
│   ├── Repositories/      # Repository implementations
│   ├── DataSources/       # Remote & local data sources
│   ├── DTOs/              # Data Transfer Objects
│   └── Mappers/           # DTO → Domain model mappers
│
└── Presentation/
    ├── ViewModels/        # State + UI logic (Combine)
    ├── Views/             # UIKit views (View Code)
    ├── ViewControllers/   # UIKit view controllers
    └── Coordinators/      # Navigation flow controllers
```

For a full explanation of the architecture, see [ARCHITECTURE.md](ARCHITECTURE.md).

---

## Prerequisites

- **Xcode 15+**
- **iOS 17+** deployment target
- **SwiftLint** — install via Homebrew:

```bash
brew install swiftlint
```

---

## Getting Started

```bash
# 1. Clone the repository
git clone https://github.com/rudrigaum/FutTrack.git
cd FutTrack

# 2. Open the Xcode project
open FutTrack.xcodeproj

# 3. Select your simulator or device, then build (⌘B) and run (⌘R)
```

---

## Project Structure

```
FutTrack/
├── FutTrack/              # Main app target
├── FutTrackTests/         # Unit tests
├── FutTrackUITests/       # UI tests
├── .swiftlint.yml         # SwiftLint configuration
├── .editorconfig          # Editor configuration
├── Makefile               # Common development commands
├── ARCHITECTURE.md        # Architecture documentation
├── CONTRIBUTING.md        # Contribution guidelines
├── CHANGELOG.md           # Release history
└── LICENSE                # MIT License
```

---

## Common Commands

```bash
make build    # Build the project
make test     # Run unit tests
make lint     # Run SwiftLint
make clean    # Clean build artifacts
```

---

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting a pull request.

---

## Roadmap

- [x] Project setup & architecture foundation
- [ ] League management screens
- [ ] Fixture scheduling
- [ ] Player statistics dashboard
- [ ] Offline support
- [ ] Android expansion
- [ ] Web platform

---

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
