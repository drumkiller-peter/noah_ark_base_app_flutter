---
status: partly superseded by ADR-0013 (Flutter flavors) and ADR-0015 (`--dart-define`)
---

# Hybrid Baked and Dynamic White-Label Tenancy

The client architecture supports both compile-time baked configurations (via `--dart-define=TENANT_KEY=...` with Flutter flavors/schemes for church-specific app store releases) and runtime dynamic tenant resolution (via domain hostname inspection on Web, or church code/QR picker in generic builds).

## Considered Options

- **Compile-time only**: Rejected: forces every preview, Web deployment, and multi-tenant admin testing scenario to produce separate build outputs.
- **Dynamic selection only**: Rejected: eliminates white-label capability where each church has its own standalone named listing and app icon in Google Play and Apple App Store.

## Consequences

- An `AppConfig` abstraction determines tenant identity at startup: if a baked `tenant_key` is present, it is locked; otherwise it resolves from the Web hostname or persisted user selection.
- All HTTP calls through the network client automatically supply the resolved `X-Tenant-Key` header.
- The UI theme dynamically adapts branding colors and assets while preserving a consistent design language.
