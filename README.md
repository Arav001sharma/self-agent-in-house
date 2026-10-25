# self-agent-in-house
> AI Agent for Intel Mac (macOS 13.7.8+) & Apple Silicon

Tiny AI companions that live on your macOS dock.

**Bruce** and **Jazz** walk back and forth above your dock. Click one to open an AI terminal. They walk, they think, they vibe.

Supports **Claude Code**, **OpenAI Codex**, **GitHub Copilot**, and **Google Gemini** CLIs — switch between them from the menubar.

## Features

- Animated characters rendered from transparent HEVC video
- Click a character to chat with AI in a themed popover terminal
- Switch between Claude, Codex, Copilot, and Gemini from the menubar
- Four visual themes: Peach, Midnight, Cloud, Moss
- Slash commands: `/clear`, `/copy`, `/help` in the chat input
- Copy last response button in the title bar
- Thinking bubbles with playful phrases while your agent works
- Sound effects on completion
- First-run onboarding with a friendly welcome
- Auto-updates via Sparkle

## Requirements

- macOS Ventura (13.0+) — tested on macOS 13.7.8 Intel (x86_64) & Apple Silicon
- Universal binary support
- At least one supported CLI installed:
  - [Claude Code](https://claude.ai/download) — `curl -fsSL https://claude.ai/install.sh | sh`
  - [OpenAI Codex](https://github.com/openai/codex) — `npm install -g @openai/codex`
  - [GitHub Copilot](https://github.com/github/copilot-cli) — `brew install copilot-cli`
  - [Google Gemini CLI](https://github.com/google-gemini/gemini-cli) — `npm install -g @google/gemini-cli`

## Building

Run the custom build script:
```bash
chmod +x build.sh
./build.sh
```

Or open `lil-agents.xcodeproj` in Xcode and hit run.

## Database & Backend

Database migrations and schemas are available under `supabase/schema.sql`.

## License

MIT License. See [LICENSE](LICENSE) for details.

