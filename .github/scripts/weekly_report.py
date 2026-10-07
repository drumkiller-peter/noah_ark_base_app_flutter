#!/usr/bin/env python3
"""Email a weekly summary of this repo's commits and pushes, written by Gemini.

Run by .github/workflows/weekly-report.yml. Standard library only.

Environment:
  GEMINI_API_KEY   Google AI Studio key (free tier). Without it the email
                   still goes out, with the commit list but no summary.
  GEMINI_MODEL     default "gemini-flash-latest"
  SMTP_USERNAME    sender address, e.g. you@gmail.com
  SMTP_PASSWORD    for Gmail, an App Password (not your account password)
  REPORT_TO        recipient(s), comma-separated; default SMTP_USERNAME
  SMTP_HOST        default smtp.gmail.com
  SMTP_PORT        default 465 (SSL); 587 uses STARTTLS
  REPORT_DAYS      how far back to look; default 7
  GITHUB_TOKEN, GITHUB_REPOSITORY
                   set in Actions; used to list pushes and link commits

Local test, writes the email to weekly-report.html instead of sending:
  python3 .github/scripts/weekly_report.py --dry-run
"""

import collections
import datetime as dt
import html
import json
import os
import re
import smtplib
import subprocess
import sys
import time
import urllib.error
import urllib.request
from email.message import EmailMessage

DAYS = int(os.environ.get("REPORT_DAYS") or 7)
REPO = os.environ.get("GITHUB_REPOSITORY", "")
MODEL = os.environ.get("GEMINI_MODEL") or "gemini-flash-latest"
MAX_PROMPT_CHARS = 120_000

FIELD, RECORD = "\x1f", "\x1e"
# Real branches only: --all would also read refs/stash and the hidden
# refs/agents/* checkpoints that agent tools save; origin/HEAD duplicates
# the default branch.
BRANCHES = ["--exclude=*/HEAD", "--remotes", "--branches"]


def git(*args):
    return subprocess.run(
        ["git", *args], check=True, capture_output=True, text=True
    ).stdout


def project_name():
    if REPO:
        return REPO.split("/")[-1]
    return os.path.basename(git("rev-parse", "--show-toplevel").strip())


def collect_commits(since):
    fmt = FIELD.join(["%H", "%h", "%an", "%aI", "%S", "%s", "%b"]) + FIELD
    out = git(
        "log", *BRANCHES, "--source", f"--since={since.isoformat()}",
        "--date-order", f"--pretty=format:{RECORD}{fmt}", "--shortstat",
    )
    commits = []
    for record in out.split(RECORD)[1:]:
        full, short, author, date, ref, subject, body, stat = record.split(FIELD)
        added = re.search(r"(\d+) insertion", stat)
        removed = re.search(r"(\d+) deletion", stat)
        files = re.search(r"(\d+) files? changed", stat)
        commits.append({
            "hash": full,
            "short": short,
            "author": author,
            "date": date,
            "branch": re.sub(r"^(refs/)?(remotes/|heads/)?(origin/)?", "", ref),
            "subject": subject.strip(),
            "body": body.strip(),
            "added": int(added.group(1)) if added else 0,
            "removed": int(removed.group(1)) if removed else 0,
            "files": int(files.group(1)) if files else 0,
        })
    return commits


def most_changed_files(since, limit=25):
    out = git(
        "log", *BRANCHES, f"--since={since.isoformat()}",
        "--name-only", "--pretty=format:",
    )
    counts = collections.Counter(line for line in out.splitlines() if line)
    return counts.most_common(limit)


def collect_pushes(since):
    """Push events from the GitHub API. Best effort: [] if unavailable."""
    token = os.environ.get("GITHUB_TOKEN")
    if not (token and REPO):
        return []
    req = urllib.request.Request(
        f"https://api.github.com/repos/{REPO}/events?per_page=100",
        headers={
            "Authorization": f"Bearer {token}",
            "Accept": "application/vnd.github+json",
        },
    )
    try:
        with urllib.request.urlopen(req, timeout=30) as resp:
            events = json.load(resp)
    except (urllib.error.URLError, json.JSONDecodeError) as e:
        print(f"Could not list pushes: {e}", file=sys.stderr)
        return []
    pushes = []
    for e in events:
        created = dt.datetime.fromisoformat(e["created_at"].replace("Z", "+00:00"))
        if e.get("type") != "PushEvent" or created < since:
            continue
        pushes.append({
            "when": created.isoformat(),
            "who": e["actor"]["login"],
            "branch": e["payload"].get("ref", "").removeprefix("refs/heads/"),
        })
    return pushes


def build_prompt(name, since, until, commits, pushes, files):
    lines = [
        f"Project: {name} (a Flutter church member app).",
        f"Period: {since:%Y-%m-%d} to {until:%Y-%m-%d}.",
        f"{len(commits)} commits, {len(pushes)} pushes.",
        "",
        "COMMITS (newest first):",
    ]
    for c in commits:
        lines.append(
            f"- {c['short']} [{c['branch']}] {c['date'][:10]} {c['author']}: "
            f"{c['subject']} ({c['files']} files, +{c['added']}/-{c['removed']})"
        )
        if c["body"]:
            lines.extend("    " + b for b in c["body"].splitlines() if b.strip())
    if pushes:
        lines += ["", "PUSHES:"]
        lines += [f"- {p['when'][:16]} {p['who']} -> {p['branch']}" for p in pushes]
    lines += ["", "MOST-CHANGED FILES (times changed):"]
    lines += [f"- {path} ({n})" for path, n in files]
    data = "\n".join(lines)[:MAX_PROMPT_CHARS]

    return f"""You write a weekly progress report for the project owner, sent by email.
Summarise the week's work using ONLY the data below. Don't invent features,
tickets or plans that the commits don't show.

Reply with an HTML fragment only (no <html>, <head>, <body>, no Markdown, no
code fences). Use only <h3>, <p>, <ul>, <li>, <strong>, <code>. Sections:
1. <h3>Overview</h3>: 2-4 sentences on what the week achieved.
2. <h3>What changed</h3>: bullets grouped by feature or area, plain language,
   with commit short hashes in <code>.
3. <h3>Fixes and housekeeping</h3>: bug fixes, docs, refactors, config.
   Leave the section out if there were none.
4. <h3>Worth a look</h3>: anything that looks unfinished, risky or reverted,
   judged only from the data. Leave the section out if nothing stands out.
Keep it under 350 words.

DATA:
{data}
"""


def summarise(prompt):
    key = os.environ.get("GEMINI_API_KEY")
    if not key:
        raise RuntimeError("GEMINI_API_KEY is not set")
    req = urllib.request.Request(
        f"https://generativelanguage.googleapis.com/v1beta/models/{MODEL}:generateContent",
        data=json.dumps({
            "contents": [{"parts": [{"text": prompt}]}],
            "generationConfig": {"temperature": 0.3},
        }).encode(),
        headers={"Content-Type": "application/json", "x-goog-api-key": key},
    )
    for attempt in range(3):
        try:
            with urllib.request.urlopen(req, timeout=120) as resp:
                body = json.load(resp)
            break
        except urllib.error.HTTPError as e:
            detail = e.read().decode(errors="replace")[:500]
            # Free-tier rate limits and overloads are worth a retry.
            if e.code in (429, 500, 503) and attempt < 2:
                time.sleep(20 * (attempt + 1))
                continue
            raise RuntimeError(f"Gemini returned {e.code}: {detail}") from e
    parts = body["candidates"][0]["content"]["parts"]
    text = "".join(p.get("text", "") for p in parts).strip()
    return re.sub(r"^```(?:html)?\s*|\s*```$", "", text)


def commit_url(c):
    return f"https://github.com/{REPO}/commit/{c['hash']}" if REPO else ""


def render_html(name, since, until, commits, pushes, summary_html, error):
    e = html.escape
    authors = sorted({c["author"] for c in commits})
    added = sum(c["added"] for c in commits)
    removed = sum(c["removed"] for c in commits)
    branches = sorted({c["branch"] for c in commits})

    rows = []
    for c in commits:
        url = commit_url(c)
        sha = f'<a href="{e(url)}">{e(c["short"])}</a>' if url else e(c["short"])
        rows.append(
            "<tr>"
            f'<td style="padding:4px 8px;font-family:monospace">{sha}</td>'
            f'<td style="padding:4px 8px">{e(c["date"][:10])}</td>'
            f'<td style="padding:4px 8px">{e(c["branch"])}</td>'
            f'<td style="padding:4px 8px">{e(c["subject"])}</td>'
            f'<td style="padding:4px 8px;white-space:nowrap">+{c["added"]} / -{c["removed"]}</td>'
            "</tr>"
        )

    if summary_html:
        summary = summary_html
    elif error:
        summary = (
            f'<p style="color:#a33"><strong>No AI summary this week:</strong> '
            f"{e(error)}</p>"
        )
    else:
        summary = "<p>No commits this week.</p>"

    push_line = f" · {len(pushes)} pushes" if pushes else ""
    return f"""<!doctype html>
<html><body style="font-family:-apple-system,Segoe UI,Roboto,sans-serif;line-height:1.5;color:#222;max-width:760px;margin:auto;padding:16px">
<h2 style="margin-bottom:4px">{e(name)}: weekly report</h2>
<p style="color:#666;margin-top:0">{since:%b %d} – {until:%b %d, %Y} ·
{len(commits)} commits{push_line} · +{added} / -{removed} lines ·
{e(", ".join(authors) or "no authors")}<br>
Branches: {e(", ".join(branches) or "none")}</p>
{summary}
{"<h3>All commits</h3><table style='border-collapse:collapse;font-size:13px'>" + "".join(rows) + "</table>" if rows else ""}
<p style="color:#999;font-size:12px">Sent by .github/workflows/weekly-report.yml · summary by {e(MODEL)}</p>
</body></html>"""


def render_text(name, since, until, commits, summary_html, error):
    summary = re.sub(r"<[^>]+>", "", (summary_html or "").replace("<li>", "<li>- "))
    summary = html.unescape(summary).strip() or error or "No commits this week."
    lines = [f"{name}: weekly report, {since:%b %d} – {until:%b %d, %Y}", "", summary, ""]
    lines += [f"{c['short']} {c['date'][:10]} [{c['branch']}] {c['subject']}" for c in commits]
    return "\n".join(lines)


def send(subject, text, html_body):
    user = os.environ["SMTP_USERNAME"]
    password = os.environ["SMTP_PASSWORD"]
    to = os.environ.get("REPORT_TO") or user
    host = os.environ.get("SMTP_HOST") or "smtp.gmail.com"
    port = int(os.environ.get("SMTP_PORT") or 465)

    msg = EmailMessage()
    msg["Subject"], msg["From"], msg["To"] = subject, user, to
    msg.set_content(text)
    msg.add_alternative(html_body, subtype="html")

    if port == 465:
        with smtplib.SMTP_SSL(host, port, timeout=60) as s:
            s.login(user, password)
            s.send_message(msg)
    else:
        with smtplib.SMTP(host, port, timeout=60) as s:
            s.starttls()
            s.login(user, password)
            s.send_message(msg)


def main():
    dry_run = "--dry-run" in sys.argv
    until = dt.datetime.now(dt.timezone.utc)
    since = until - dt.timedelta(days=DAYS)
    name = project_name()

    commits = collect_commits(since)
    pushes = collect_pushes(since)
    print(f"{len(commits)} commits, {len(pushes)} pushes since {since:%Y-%m-%d}")

    summary_html, error = "", ""
    if commits:
        prompt = build_prompt(name, since, until, commits, pushes, most_changed_files(since))
        try:
            summary_html = summarise(prompt)
        except Exception as e:  # The commit list is still worth sending.
            error = str(e)
            print(f"Summary failed: {error}", file=sys.stderr)

    subject = f"[{name}] Weekly report: {since:%b %d} – {until:%b %d}"
    html_body = render_html(name, since, until, commits, pushes, summary_html, error)
    text = render_text(name, since, until, commits, summary_html, error)

    if dry_run:
        with open("weekly-report.html", "w") as f:
            f.write(html_body)
        print(f"Dry run: wrote weekly-report.html ({subject})")
    else:
        send(subject, text, html_body)
        print(f"Sent: {subject}")


if __name__ == "__main__":
    main()
