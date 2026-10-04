# Feature-First Clean Architecture with BLoC and Drift

The Flutter application is structured by feature (`lib/src/features/<feature>/domain, data, presentation`), using BLoC/Cubit for event-driven reactive state management and Drift (SQLite) for offline-first local persistence.

## Considered Options

- **Layer-First Architecture**: Grouping by `blocs/`, `models/`, `views/`. Rejected: makes multi-developer feature work messy and obscures module boundaries as the codebase grows across 10+ church domains.
- **Riverpod**: Rejected in favor of BLoC to align with team familiarity while preserving strict separation of concerns, testability, and unidirectional data flow.

## Consequences

- Each feature owns its data contracts (DTOs, datasources), domain entities and repository interfaces, and presentation layers (BLoCs, screens, widgets).
- Shared cross-cutting concerns (authentication session, networking client, theme, local database) live under `lib/src/core/`.
- Drift provides type-safe offline caching with SQLite, enabling offline access to hymns, daily quotes, and bulletins across all supported platforms.
