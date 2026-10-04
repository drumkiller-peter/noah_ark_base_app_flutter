# Declarative Stateful Shell Routing with GoRouter

The application utilizes GoRouter with `StatefulShellRoute.indexedStack` to maintain parallel tab state across multi-surface form factors (mobile bottom navigation bar and desktop/tablet navigation rail).

## Considered Options

- **Navigator 1.0 (push/pop)**: Rejected: fails web browser history synchronization, back/forward button parity, and direct URL deep linking.
- **Custom RouterDelegate**: Rejected: high maintenance overhead compared to standard GoRouter patterns.

## Consequences

- Direct URLs work seamlessly across Web, Desktop, and Mobile deep linking.
- Switching between Devotional, Hymns, Events, Prayer Chain, and Giving preserves scroll position and state without reloading.
