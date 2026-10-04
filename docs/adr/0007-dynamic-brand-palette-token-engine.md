---
status: superseded by ADR-0011
---

# Dynamic Brand Palette Token Engine for White-Labeling

Each church provides a primary brand color, optional accent, logo asset, and congregation name. The client dynamically derives a complete Material 3 palette and design token system (supporting light and dark modes) while maintaining typography (Inter for English, Mukta for Nepali) and UI layout consistency across all white-label instances.

## Considered Options

- **Static hardcoded themes per church**: Rejected: requires modifying source code and recompiling every time a new church joins the platform.
- **Remote runtime layout injection**: Rejected: excessive complexity and potential UI performance regressions.

## Consequences

- White-label customization is decoupled from UI layout code.
- New church branding can be deployed instantly through configuration files or tenant metadata APIs without changing widget trees.
