# 0012: Editorial Serif and Sanctuary Typography Pairing

## Context

The member app's default typography used uniform sans-serif system fonts across all headings, verses, and cards. While functional, it lacked the reverent warmth, literary gravitas, and editorial distinction expected of a church sanctuary app, making Scripture passages and daily reflections read like a generic dashboard.

## Decision

We adopt an intentional **"Serif & Sans"** typography pairing in `AppTheme`:

1. **Editorial Serif (`Newsreader`)** is applied to:
   - Display headlines (`headlineLarge`, `headlineMedium`)
   - Screen and card titles (`titleLarge`)
   - Scripture citations and verses
   - Hero greetings and church brand titles

2. **Geometric Sans (`Inter`)** is applied to:
   - Body paragraphs (`bodyLarge`, `bodyMedium`, `bodySmall`)
   - Interactive controls, buttons, and navigation labels
   - Subtitles and metadata

3. **Sanctuary Tracking Badges**:
   - Sub-headings and category markers (`TODAY'S SCRIPTURE`, `REFLECTION`, `PRAYER FOR TODAY`, `FELLOWSHIP HIGHLIGHTS`) use uppercase sans text with `letterSpacing: 1.0` and bold weight (800), tinted with the church's domain colors.

4. **Helpers**:
   - `AppTheme.serif(...)` and `AppTheme.sans(...)` expose convenient builders for custom inline formatting.

## Consequences

- The app feels dignified, warm, and distinctly church-focused while maintaining high readability on long-form reflections.
- All typography continues to strictly read contrast-checked colors through `context.churchColors` (`colors.text`, `colors.textMuted`, `colors.primary`).
- In offline or test environments, `google_fonts` falls back gracefully to system fonts without crashing or stalling test runners.
