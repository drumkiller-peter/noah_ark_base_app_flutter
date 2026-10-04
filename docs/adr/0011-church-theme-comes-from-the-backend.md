# The church Theme comes from the backend and is applied at launch

A church's colors are its Theme, read from the backend's `GET /theme` rather than derived in the app from one brand color: twelve colors named by job (`primary`, `error`, `text`, …) in a light and a dark set, already resolved against the platform's Default Theme, so the app never invents a color. Text on a filled color is black or white by contrast, chosen by the app, so no Theme can make a button unreadable. The Theme is chosen once, before the first frame: a kept copy if there is one, otherwise up to about two seconds of waiting on the splash screen, otherwise the Default Theme baked into the app. A fresh copy is always fetched and kept for the next launch.

## Considered Options

- **Derive a palette from one brand color in the app** (ADR 0007). Rejected: a church could not fix the one derived color it disliked, and every client would have to derive identically.
- **Switch colors the moment a new Theme arrives.** Rejected: the app would change colors under someone mid-session; a Theme change waiting for the next launch costs nothing.

## Consequences

- The Default Theme exists twice — `app/models/theme.py` in the backend and `church_colors.dart` here — and the two must be changed together.
- Widgets read colors through `context.churchColors`; a hardcoded color is a bug, because it ignores both the church and light/dark mode.
- A church's icon, store name, and splash screen stay in its build; only colors are runtime.
