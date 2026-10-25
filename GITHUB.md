# GitHub Repository Documentation

**Repository**: [https://github.com/Arav001sharma/self-agent-in-house](https://github.com/Arav001sharma/self-agent-in-house)  
**Branch**: `main`  
**Target Environment**: macOS Intel (x86_64, macOS 13.7.8+) & Apple Silicon Universal  

---

## Remote Configuration

To check or update the remotes configured in this workspace:

```bash
# View all remotes
git remote -v

# The self-agent remote points to:
# https://github.com/Arav001sharma/self-agent-in-house.git
```

## Quick Commands

### Push changes to GitHub
```bash
~/bin/gh auth setup-git
git add -A
git commit -m "Your commit message"
git push self-agent main
```

### Pull latest updates from GitHub
```bash
git pull self-agent main
```

---

## Project Structure

- `LilAgents/`: Swift source code for the macOS desktop companion agent and terminal integration.
  - `GeminiSession.swift`: Handles Google Gemini CLI interaction and session streaming.
  - `LilAgentsApp.swift`: Main app lifecycle and menu bar management.
- `build.sh`: Automated compilation script targeting macOS Intel (`x86_64-apple-macos13.0`) and packaging to `/Applications/LilAgents.app`.
- `supabase/`: Database schema, migrations, and backend definitions (`schema.sql`).
- `.github/workflows/build.yml`: CI workflow for GitHub Actions.
