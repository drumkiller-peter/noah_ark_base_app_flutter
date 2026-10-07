# Build settings come from a `.env` file, generated in by envied

The app's build settings (`TENANT_KEY`, `API_BASE_URL`, `CHURCH_NAME`, `CLIENT_ID`, `CLIENT_SECRET`) live in a git-ignored `.env`. The `envied` package reads it during `dart run build_runner build` and generates `Env` in `lib/src/core/config/env.g.dart`, also git-ignored. `AppConfig.fromEnv()` reads `Env`; nothing reads `String.fromEnvironment`. The client ID and secret are obfuscated in the generated code. A missing `.env` or key reads as empty, and `AppConfig` applies its defaults. `build.yaml` lists `.env` as a source so that editing it regenerates `env.g.dart`.

Settings stay fixed when the app is built, so ADR 0005's baked-versus-dynamic split is unchanged.

## Considered Options

- **`--dart-define-from-file=dart_defines.json`** (what ADR 0013 described). Rejected: every `flutter run` and launch configuration had to pass the flag, and forgetting it silently built an app with no client credentials.
- **`flutter_dotenv`, loaded at runtime.** Rejected: `.env` ships as a plain-text asset, which the web app serves to anyone at `/assets/.env`, client secret included; startup gains an async load; and the build fails when the file is missing.

## Consequences

- After editing `.env`, run `dart run build_runner build -d`; until then the app keeps the old values. `--dart-define` no longer changes any setting.
- Each church folder from ADR 0013 holds a git-ignored `.env` in place of `dart_defines.json`. `tool/build_member_app.sh` copies it to the repo root and runs `build_runner` before building.
- Obfuscation only slows extraction; the client secret is still not really secret (see the README), as with `--dart-define`.
- Tests build `AppConfig.resolve()` directly, so they don't depend on a developer's `.env`.
