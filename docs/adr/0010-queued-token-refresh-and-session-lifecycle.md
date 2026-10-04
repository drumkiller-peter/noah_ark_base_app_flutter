# Queued Token Refresh and Session Lifecycle

All HTTP requests pass through a custom `QueuedInterceptor` in Dio to prevent race conditions during refresh token rotation.

## Considered Options

- **Concurrent direct refresh**: Rejected: the backend revokes the previous refresh token immediately on use. Concurrent refresh calls using the same token would invalidate the user session.

## Consequences

- When an access token expires (`401 Unauthorized`), all outgoing requests are queued behind a single atomic refresh operation.
- If refresh succeeds, stored tokens in `flutter_secure_storage` are updated, and queued requests replay with the new bearer token.
- If refresh fails, the session is invalidated, and the network client gracefully falls back to the background guest token while notifying the authentication BLoC.
