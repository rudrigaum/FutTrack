# Contributing to FutTrack

Thank you for your interest in contributing to FutTrack! This document provides guidelines and instructions to help you contribute effectively.

---

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Branch Naming](#branch-naming)
- [Commit Convention](#commit-convention)
- [Pull Request Process](#pull-request-process)
- [Code Style](#code-style)
- [Testing Requirements](#testing-requirements)

---

## Code of Conduct

Please read and follow our [Code of Conduct](CODE_OF_CONDUCT.md). We expect all contributors to uphold it.

---

## Branch Naming

Use the following naming conventions for branches:

| Type | Pattern | Example |
|---|---|---|
| New feature | `feature/<short-description>` | `feature/standings-screen` |
| Bug fix | `bugfix/<short-description>` | `bugfix/fixture-date-crash` |
| Hotfix | `hotfix/<short-description>` | `hotfix/login-null-pointer` |
| Chore / config | `chore/<short-description>` | `chore/update-swiftlint` |
| Documentation | `docs/<short-description>` | `docs/architecture-update` |

Branch names should be lowercase and use hyphens as separators.

---

## Commit Convention

This project follows the [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Format

```
<type>(<optional scope>): <short description>

[optional body]

[optional footer(s)]
```

### Types

| Type | Description |
|---|---|
| `feat` | A new feature |
| `fix` | A bug fix |
| `chore` | Maintenance tasks, dependency updates |
| `docs` | Documentation changes only |
| `refactor` | Code changes that neither fix a bug nor add a feature |
| `test` | Adding or updating tests |
| `style` | Formatting, whitespace (no logic changes) |
| `ci` | CI/CD configuration changes |
| `perf` | Performance improvements |

### Examples

```
feat(standings): add goal-difference sorting to league table
fix(fixtures): correct date formatting for GMT-3 timezone
docs(readme): add getting started section
refactor(viewmodel): extract state handling into base class
test(usecase): add unit tests for FetchStandingsUseCase
```

---

## Pull Request Process

1. **Fork** the repository and create your branch from `main` (or the relevant feature branch).
2. Follow the [Branch Naming](#branch-naming) and [Commit Convention](#commit-convention) guidelines.
3. Ensure all tests pass locally before opening a PR.
4. Run `make lint` and fix any SwiftLint warnings or errors.
5. Fill in the [pull request template](.github/pull_request_template.md) completely.
6. Request a review from at least one maintainer.
7. Address all review comments before the PR can be merged.
8. PRs are merged using **Squash and Merge** to keep the main branch history clean.

### Code Review Expectations

- Be respectful and constructive in your feedback.
- Review for correctness, readability, test coverage, and adherence to the architecture.
- Reviewers should respond within 2 business days.
- Authors should address feedback within 3 business days.

---

## Code Style

### SwiftLint

All code must pass SwiftLint without errors. Warnings should be minimized. See [`.swiftlint.yml`](.swiftlint.yml) for the full configuration.

Run the linter with:

```bash
make lint
```

### General Rules

- All **code, comments, variable names, and file content** must be written in **English**.
- Use View Code (no storyboards, no XIBs).
- Follow the Clean Architecture + MVVM-C patterns described in [ARCHITECTURE.md](ARCHITECTURE.md).
- Prefer protocols over concrete types for dependencies (Dependency Injection).
- Use `async/await` for asynchronous operations; use Combine only for UI bindings.

> **Note:** Team communication (PR descriptions, issue comments, Slack, etc.) may be in Portuguese.

---

## Testing Requirements

- All new features must include unit tests for their UseCases and ViewModels.
- Bug fixes must include a regression test that reproduces the bug before the fix.
- Aim for a minimum of **80% code coverage** on the Domain and Data layers.
- UI tests should cover critical user flows.
- Run tests with:

```bash
make test
```
