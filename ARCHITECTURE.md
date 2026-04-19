# Architecture

FutTrack follows **Clean Architecture** combined with **MVVM-C** (Model-View-ViewModel-Coordinator) to ensure separation of concerns, testability, and scalability.

## Layers Overview

```
┌─────────────────────────────────────────────┐
│              Presentation Layer              │
│  Views · ViewControllers · ViewModels · Coordinators  │
├─────────────────────────────────────────────┤
│                Domain Layer                  │
│           Entities · Use Cases               │
├─────────────────────────────────────────────┤
│                 Data Layer                   │
│   Repositories · DataSources · DTOs · Mappers │
└─────────────────────────────────────────────┘
```

**Dependency Rule**: outer layers depend on inner layers, never the opposite. Domain has zero dependencies on Data or Presentation.

## Folder Structure

```
FutTrack/
├── Domain/
│   ├── Entities/          # Pure business models
│   └── UseCases/          # Business rules and logic
├── Data/
│   ├── Repositories/      # Protocol implementations
│   ├── DataSources/       # Remote and local data access
│   ├── DTOs/              # Data Transfer Objects
│   └── Mappers/           # DTO → Domain transformations
├── Presentation/
│   ├── Views/             # UIView subclasses (View Code)
│   ├── ViewControllers/   # UIViewController subclasses
│   ├── ViewModels/        # State + UI logic
│   └── Coordinators/      # Navigation flow
└── Infrastructure/
    ├── Network/           # HTTP client, API configuration
    ├── Storage/           # Keychain, UserDefaults, CoreData
    └── DI/                # Dependency injection setup
```

## Domain Layer

The innermost layer containing pure business logic with no external dependencies.

### Entities

Plain Swift structs/classes representing core business models (e.g., `League`, `Match`, `Player`, `Team`). They contain no framework imports.

### Use Cases

Each use case encapsulates a single business operation, defined by a protocol:

```swift
protocol FetchLeagueStandingsUseCaseProtocol {
    func execute(leagueId: String) async throws -> [Standing]
}
```

## Data Layer

Responsible for data access and transformation.

### Repositories

Concrete implementations of repository protocols defined in the Domain layer. They coordinate between data sources and map DTOs to domain entities.

### DataSources

Handle actual data fetching — remote (API calls) or local (CoreData, UserDefaults, Keychain).

### DTOs & Mappers

DTOs mirror API/database response structures. Mappers convert DTOs into Domain entities, keeping the Domain layer decoupled from external data formats.

## Presentation Layer

Handles everything the user sees and interacts with.

### Views (UIKit View Code)

Pure `UIView` subclasses responsible only for layout using `NSLayoutAnchor`. No business logic. No Storyboards.

### ViewControllers

Lightweight controllers that bind Views to ViewModels. They observe state changes and delegate user actions.

### ViewModels

Hold UI state and transform domain data for display. Expose state via Combine publishers:

```swift
final class LeagueViewModel {
    @Published private(set) var state: ViewState<[Standing]> = .idle

    private let useCase: FetchLeagueStandingsUseCaseProtocol

    init(useCase: FetchLeagueStandingsUseCaseProtocol) {
        self.useCase = useCase
    }

    func loadStandings(leagueId: String) async {
        state = .loading
        do {
            let standings = try await useCase.execute(leagueId: leagueId)
            state = .success(standings)
        } catch {
            state = .error(.unknown)
        }
    }
}
```

### Coordinators

Manage navigation flow following the **Coordinator Pattern**:

- Each flow has its own Coordinator
- Parent coordinators manage child coordinators
- ViewControllers never know about other ViewControllers
- Prevents tight coupling and supports deep linking

```swift
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
```

## State Management

All ViewModels use a generic `ViewState` enum:

```swift
enum ViewState<T> {
    case idle
    case loading
    case success(T)
    case error(AppError)
}
```

## Error Handling

Centralized through `AppError`:

```swift
enum AppError: Error {
    case network
    case parsing
    case business(String)
    case unknown
}
```

## Dependency Injection

All dependencies are injected via **constructor injection** using protocols:

```swift
final class LeagueViewModel {
    private let useCase: FetchLeagueStandingsUseCaseProtocol

    init(useCase: FetchLeagueStandingsUseCaseProtocol) {
        self.useCase = useCase
    }
}
```

This enables easy mocking for unit tests and keeps components decoupled.

## Concurrency

- **async/await** for all asynchronous operations
- **Combine** used exclusively for UI binding (`@Published`, `CurrentValueSubject`)
- **GCD** is avoided in favor of structured concurrency
- **[weak self]** enforced in closures to prevent retain cycles

## Testing Strategy

- **Unit Tests**: ViewModels, UseCases, Mappers
- **Mocks**: Created via protocols for all dependencies
- **Coverage Target**: 80%+ on Domain and Data layers
- **Framework**: XCTest