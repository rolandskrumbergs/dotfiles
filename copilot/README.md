# Copilot CLI Dotfiles

My GitHub Copilot CLI configuration — agents, skills, MCP servers, and settings.

## What's Included

| Path | Description |
|------|-------------|
| `settings.json` | Model preference, plugin config, effort level |
| `mcp-config.json` | MCP server definitions (Azure, Playwright, Chrome DevTools) |
| `copilot-instructions.md` | Global coding instructions |
| `agents/*.md` | 7 custom agents (code-reviewer, security-auditor, etc.) |
| `skills/*.md` | 30 custom skills (TDD, React, EF Core, Azure, etc.) |

## Installation

```powershell
git clone <your-repo-url> ~/dotfiles-copilot
cd ~/dotfiles-copilot/copilot
.\install.ps1
```

Use `-Force` to overwrite without creating backups:

```powershell
.\install.ps1 -Force
```

## Notes

- Plugins referenced in `settings.json` auto-install on first Copilot CLI launch.
- Machine-specific config (`config.json` — login, trusted folders) is not tracked.
- Restart Copilot CLI after running the install script.
