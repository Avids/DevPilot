#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL="$ROOT/.agents/skills/ai-software-development"
mkdir -p "$HOME/.agents/skills" "$HOME/.hermes/skills"
rm -rf "$HOME/.agents/skills/ai-software-development" "$HOME/.hermes/skills/ai-software-development"
cp -R "$SKILL" "$HOME/.agents/skills/ai-software-development"
cp -R "$SKILL" "$HOME/.hermes/skills/ai-software-development"
echo "Installed shared skill to:"
echo "  $HOME/.agents/skills/ai-software-development"
echo "  $HOME/.hermes/skills/ai-software-development"
echo
echo "Optional global AGENTS.md source: $ROOT/global/AGENTS.md"
echo "Copy/merge it into your tool's global instruction location only if desired."
