# Assigned Pastor validity is resolved at read time

A Private Prayer Request's Assigned Pastor can stop being valid at any moment: their account can be deleted, deactivated, or given another role. Whether the assignment still holds is decided when the request is read, by checking the named Pastor's current role and active status, rather than kept in sync by a hook that fires when a role changes.

## Considered Options

- **Eager invalidation** (a hook on every place a user's role or active status can change walks their assigned requests and clears the field). Rejected: a confidentiality guarantee should fail safe by construction, and an eager hook fails open instead — a future code path that writes a role change without knowing to call the hook leaves a private request readable by someone who is no longer a Pastor, silently, until someone notices. Read-time resolution has no such code path to forget: every read re-checks the one authorization rule that matters.
- **Cached validity flag on the request** (store a boolean set by the hook, trusted at read time). Rejected for the same reason as eager invalidation once a hook is in the loop; it also adds a field that can drift from the truth it is supposed to summarize.

## Consequences

- A read that resolves the Assigned Pastor checks the User document for that id: role is still `pastor` and the account is still active. Failing either check, the request is presented as unassigned rather than pointing at a stale Pastor.
- No background job walks Private Prayer Requests when a Pastor is deleted, deactivated, or reassigned another role. The request's stored `assigned_pastor_id` may briefly be stale between the moment a Pastor stops qualifying and the next read, but no read ever honours it once stale.
- The author regains an unassigned request the moment they look, with no dependency on when or whether a hook ran. They choose another Pastor, per ADR 0001.
