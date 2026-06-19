# CLAUDE.md

Guidance for Claude Code when working in this repository.

## What this is

**Architise** — a browser-based ArchiMate 3 modelling tool by Arnold Ruijter IT. It runs
entirely client-side, no installation, no backend. Users model enterprise architecture
across the Business / Application / Technology layers, draw process flows in a Swimlane
mode, and export to Archi (`.archimate`) and draw.io.

- Live: https://architise.arnoldruijterit.nl (custom domain via `CNAME`)
- Repo: `aruijter72/Architise` (the older script references the name `Archimate-engine`)
- Original goal (still open): make ArchiMate understandable for non-experts. The hard problem
  is UX/accessibility, not technical coverage.

## Architecture — read this first

**The entire application is a single file: `index.html`** (~17.7k lines). It contains all
HTML, CSS, and JavaScript inline. There is **no `package.json`, no Node, no module system,
no framework, no bundler**. It is vanilla HTML/CSS/JS.

- State is kept in the browser via `localStorage` (~30 usages); models are also saved/loaded
  as JSON files and via the native file picker (Save As).
- External libraries are loaded from CDN (cdnjs / Google Fonts):
  - `dagre@0.8.5` — graph auto-layout
  - `lz-string@1.4.4` — compression (shareable/URL state)
  - `xlsx@0.18.5` — spreadsheet import/export
  - Catamaran font (Google Fonts)
- Bilingual EN/NL throughout (UI, tooltips, onboarding, manual).

Because everything lives in `index.html`, edits are made directly in that file. There is no
build to run for normal development — open `index.html` in a browser to test.

## Build & run

- **Develop:** open `index.html` in a browser. No build step.
- **Offline build (optional):** `python3 build-offline.py` fetches the Catamaran font and
  Dagre, inlines them as base64/inline JS, and writes a fully self-contained
  `index-offline.html`. Requires Python 3.7+ and `requests` (`pip install requests`).
  Only needed when an offline/single-file copy is wanted.
- **Docker (alternative hosting):** `docker compose up` builds the `nginx:alpine` image
  (`Dockerfile`) and serves `index.html` on `localhost:8080` with a hardened `nginx.conf`
  (CSP, security headers, gzip, asset caching).

## Deploy — push-to-deploy via GitHub Pages (no CI)

There is **no GitHub Actions workflow**. GitHub Pages serves the **`main` branch / root
folder**. A `git push` to `main` publishes the site.

- `enable-github-pages.sh` — one-time setup that points Pages at `main` + `/` (root).
- `autopush.sh` — invoked by a local launchd `WatchPaths` watcher. It commits on every file
  change but **only pushes at most once every 10 minutes** (throttled via `.autopush_last_push`),
  which triggers Pages. This is why git history is full of `autopush: <timestamp>` commits.
- `autopush.log` is updated by that script and changes frequently — it is noise, not work.

Practical note: when you make a real change, your commit may be picked up and pushed by the
autopush watcher rather than by you. Don't be surprised by automatic `autopush:` commits.

## Repository layout (flat — everything in root)

- `index.html` — the whole app
- Build/deploy/hosting: `build-offline.py`, `autopush.sh`, `enable-github-pages.sh`,
  `Dockerfile`, `docker-compose.yml`, `nginx.conf`, `CNAME`
- Sample/data models: `*.archimate`, `*.json`, `*_ameff.xml`
- Branding: `*.png`, `*.svg` logos
- Docs: `Architise-projectkennis.md` (project background — useful context),
  `ArchiMate-Engine-Deployment-Guide.docx`, questionnaires (`*.xlsx`)

## Conventions

- Keep the app a single self-contained `index.html`; do not introduce a build system,
  framework, or npm dependency without explicit discussion — push-to-deploy via Pages
  relies on the file being directly servable.
- Match the existing inline code style when editing.
- Keep EN/NL strings in sync when adding or changing UI text.
