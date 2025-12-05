# AGENTS.md

Instructions for AI models working on this repository.

## README Generation Guidelines

When creating or updating README files, follow these principles:

### Tone and Style

- **Direct, not corporate.** Write like you're explaining to a friend, not a client.
- **No fluff.** Every sentence should be useful. If it doesn't help the user run the project, cut it.
- **Scannable.** Users should find what they need in under 60 seconds.
- **No emojis** unless explicitly requested.
- **No em dashes (—).** Use colons, commas, or rewrite the sentence.

### Tone Examples

**Too corporate:**
> "This comprehensive solution enables users to seamlessly export their Medium articles while providing robust image mirroring capabilities..."

**Too casual:**
> "So basically this thing grabs your Medium stuff and dumps it into markdown lol"

**Just right:**
> "Export Medium posts to Markdown. Optionally downloads images locally."

### Structure (in order)

```
# Title + Badges (top right)

One-liner description of what it does.

One sentence on why it's useful.

> Quick note about sample files or important context (optional)

## Setup
  - Requirements (one line)
  - Clone command
  - Docker path (if available)
  - Python/native path

## Commands
  - Tables for CLI options
  - One practical example

## Output
  - Directory structure only
  - What files contain (one line)

## Config/API Setup (if needed)
  - Bullet points, not paragraphs
  - 4-5 steps max

## Rate Limits / Constraints (if applicable)
  - Bullet points

## Troubleshooting
  - Table format: Error | Fix

---
Footer (optional, one line)
```

### Formatting Rules

1. **Use tables** for options, commands, and troubleshooting. Tables are faster to scan than lists.

2. **Code blocks should be copy-paste ready.** Include the full command, not fragments.

3. **One example per concept.** Don't show 5 variations of the same command.

4. **Headings are navigation.** Use `##` for main sections only. Avoid deep nesting (`####`).

5. **Badges go top-right** using: `<div align="right">![Badge](url)</div>`

6. **Blockquotes (`>`)** for important notes that aren't warnings.

7. **Bold** for emphasis on key terms, not for decoration.

### Badge Patterns

Common badges with ready-to-use templates (via [shields.io](https://shields.io)):

| Badge | Code |
|-------|------|
| Python | `![Python](https://img.shields.io/badge/Python-3.7+-blue?logo=python&logoColor=white)` |
| Docker | `![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white)` |
| License | `![License](https://img.shields.io/badge/License-MIT-green)` |
| AI Generated | `![AI](https://img.shields.io/badge/AI-Generated-blueviolet)` |
| Medium | `![Medium](https://img.shields.io/badge/Medium-12100E?logo=medium&logoColor=white)` |

Always include the Medium shield badge (linked to the provided article) whenever a README references a Medium post or the console supplies one.
Use the HTML form `<div align="right"><a href="..."><img src="..." alt="Medium" /></a></div>` when positioning the badge so it renders reliably.

### Environment Variables

Document env vars in a table format:

| Variable | Required | Description |
|----------|----------|-------------|
| `API_KEY` | Yes | Your API key |
| `DEBUG` | No | Enable debug mode (default: false) |

### Command Output

Only show command output when:
- It confirms success in a non-obvious way
- It helps users verify they did it right
- The output format matters for next steps

Skip output for self-explanatory commands like `git clone` or `pip install`.

### What to Remove

- "Features" lists (users discover features by using the tool)
- "How It Works" sections (implementation details belong in code comments)
- "About" sections that repeat the intro
- Multiple examples showing the same thing with slight variations
- "Prerequisites" as a separate section (inline with Setup)
- Verbose step-by-step tutorials (use numbered bullets instead)
- "License" and "Acknowledgments" unless legally required or specifically requested

### Anti-Patterns

Avoid these common mistakes:

- Don't explain what `git clone` does
- Don't add "Contributing" sections to personal tools
- Don't document every flag if `--help` exists
- Don't use "simply" or "just" (if it were simple, they wouldn't need docs)
- Don't add screenshots unless UI is complex
- Don't write "In order to..." (just write what to do)
- Don't start sentences with "This will..." (just say what it does)

### What to Keep

- Everything needed to get running in 5 minutes
- Common errors and fixes
- Rate limits or constraints that affect usage
- One clear example per command type

### Length Target

- Aim for **80-120 lines** for a typical CLI tool
- If it's longer, you're probably being redundant

### Example Transformation

**Before (verbose):**
```markdown
## Prerequisites

Before you begin, ensure you have the following installed:

- Python 3.7 or higher
- pip package manager
- A RapidAPI account

## Installation

1. First, clone this repository to your local machine:
   ```bash
   git clone https://github.com/user/repo.git
   ```

2. Navigate to the project directory:
   ```bash
   cd repo
   ```

3. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```
```

**After (direct):**
```markdown
## Setup

**Requirements:** Python 3.7+, [RapidAPI key](#getting-your-api-key)

```bash
git clone https://github.com/user/repo.git
cd repo
pip install -r requirements.txt
```
```

## Code Style

This repository uses:
- Python 3.7+ with type hints
- No external formatting tools required
- Docstrings at module level only

## File Descriptions

| File | Purpose |
|------|---------|
| `fetch_medium_posts.py` | Main script - exports Medium posts via RapidAPI |
| `requirements.txt` | Python dependencies |
| `Dockerfile` | Container build instructions |
| `docker-compose.yml` | Container orchestration with volume mounts |
| `Makefile` | Simplified command shortcuts |
| `exports/` | Sample output for reference (not source code) |

## When Updating This Repository

1. Keep the README under 120 lines
2. Test commands before documenting them
3. Update Makefile if adding new workflows
4. Don't add features without updating relevant docs

## Quick Reference

| Do | Don't |
|----|-------|
| Tables for options | Bullet lists for options |
| One example per command | 5 variations of same thing |
| `##` headings only | Deep nesting `####` |
| 80-120 lines total | 300+ line READMEs |
| Copy-paste commands | Fragment commands |
| "Run X" | "In order to run X, you need to..." |
| Direct statements | "This will allow you to..." |
| Requirements inline | Separate Prerequisites section |
