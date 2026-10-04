# Pastoral Prayer history stays with its authoring Pastor across reassignment

When a Private Prayer Request is handed from one Pastor to another, the Pastoral Prayer records the first Pastor wrote are not carried over to the second. Each Pastor accumulates their own append-only history against the request; a new Assigned Pastor starts theirs empty and cannot read what the previous one wrote.

## Considered Options

- **History travels with the request** (every Assigned Pastor, past and present, reads every Pastoral Prayer ever recorded against it). Rejected: assignment is the author's choice of whom to confide in, made once per Pastor. A handoff should not retroactively widen who reads the previous Pastor's record of that confidence — the author trusted one Pastor with those specific notes, not whoever holds the request next.
- **History is deleted on handoff.** Rejected: the record is the author's own pastoral history and belongs to them regardless of who is currently assigned; the author reads every Pastoral Prayer on their request, whoever recorded it. Deleting it on reassignment would erase part of that history for no one's benefit.

## Consequences

- A Pastoral Prayer is stored against the request and the Pastor who recorded it. Listing a request's Pastoral Prayers as the current Assigned Pastor returns only the records that Pastor wrote.
- The author's read is unfiltered: every Pastoral Prayer on their request, from every Pastor who has ever held it, in one list.
- Because Pastoral Prayer is append-only (no route edits or deletes one), a Pastor's history against a request is exactly what they wrote while assigned to it, neither more nor less, even after they hand it on.
