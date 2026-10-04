# Private Prayer Requests are confidential to the Assigned Pastor

A Private Prayer Request is readable only by its author, its Assigned Pastor, and Super Admins. Other Pastors do not know it exists, and neither do Admins, even though both otherwise hold full management rights over the church. A member who picks a specific pastor is choosing whom to confide in ("I can tell Pastor Ram, not the senior pastor"), so assignment limits who can read the request instead of only naming who handles it.

## Considered Options

- **Assignment as responsibility only** (every Pastor reads every private request, and the Assigned Pastor handles it, like a Jira assignee). Rejected: choosing a pastor would look meaningful but protect nothing.
- **Super Admin excluded as well.** Rejected: platform support keeps its usual access to all church data. Super Admin passes every role check as it does everywhere else, so this is the one party beyond the author and Assigned Pastor who can read these requests.

## Consequences

- When the Assigned Pastor stops being a Pastor (their account is deleted, deactivated, or given another role), their requests go back to their authors unassigned, hidden from every Pastor, until each author chooses another Pastor. The departing pastor never picks a successor on the member's behalf.
- Reassignment by a Pastor hands over a member's confidence, so the author always sees the current Assigned Pastor and can move the request again.
- Widening who can see private requests later would break a promise members have relied on, so any such change needs its own ADR.
