#!/bin/bash
set -e

# Cofounder — AI Co-founder for Solo Founders
# One-line install: git clone https://github.com/ajsai47/get-cofounder.git ~/.cofounder && bash ~/.cofounder/install.sh

REPO_URL="https://github.com/ajsai47/get-cofounder.git"
INSTALL_DIR="$HOME/.cofounder"
SKILL_DIR="$HOME/.claude/skills/cofounder"
AGENTS_DIR="$HOME/.claude/agents"
COMMANDS_DIR="$HOME/.claude/commands"
HOOKS_DIR="$HOME/.claude/hooks/cofounder"
SETTINGS_FILE="$HOME/.claude/settings.json"

echo ""
echo "  ██████╗ ██████╗ ███████╗ ██████╗ ██╗   ██╗███╗   ██╗██████╗ ███████╗██████╗ "
echo " ██╔════╝██╔═══██╗██╔════╝██╔═══██╗██║   ██║████╗  ██║██╔══██╗██╔════╝██╔══██╗"
echo " ██║     ██║   ██║█████╗  ██║   ██║██║   ██║██╔██╗ ██║██║  ██║█████╗  ██████╔╝"
echo " ██║     ██║   ██║██╔══╝  ██║   ██║██║   ██║██║╚██╗██║██║  ██║██╔══╝  ██╔══██╗"
echo " ╚██████╗╚██████╔╝██║     ╚██████╔╝╚██████╔╝██║ ╚████║██████╔╝███████╗██║  ██║"
echo "  ╚═════╝ ╚═════╝ ╚═╝      ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═╝"
echo ""
echo "  Your AI co-founder — 10 departments, 31 agents"
echo "  Installing..."
echo ""

# Clone or update the repo
if [ -d "$INSTALL_DIR" ]; then
  echo "  → Updating existing installation..."
  cd "$INSTALL_DIR" && git pull --quiet
else
  echo "  → Downloading Cofounder..."
  git clone --quiet "$REPO_URL" "$INSTALL_DIR"
fi

# Create .claude directories if they don't exist
mkdir -p "$SKILL_DIR"
mkdir -p "$AGENTS_DIR"
mkdir -p "$COMMANDS_DIR"
mkdir -p "$HOOKS_DIR"
mkdir -p "$HOME/.claude/cofounder-memory"

# Install skill (symlink for easy updates)
echo "  → Installing skill..."
if [ -L "$SKILL_DIR" ] || [ -d "$SKILL_DIR" ]; then
  rm -rf "$SKILL_DIR"
fi
ln -sf "$INSTALL_DIR/skill" "$SKILL_DIR"

# Install agents (symlink each department)
echo "  → Installing agents..."
for dept_dir in "$INSTALL_DIR/agents"/*/; do
  dept_name=$(basename "$dept_dir")
  target="$AGENTS_DIR/$dept_name"
  if [ -L "$target" ] || [ -d "$target" ]; then
    rm -rf "$target"
  fi
  ln -sf "$dept_dir" "$target"
done

# Install commands (symlink each command file)
echo "  → Installing commands..."
for cmd_file in "$INSTALL_DIR/skill/commands"/*.md; do
  cmd_name=$(basename "$cmd_file")
  target="$COMMANDS_DIR/$cmd_name"
  if [ -L "$target" ] || [ -f "$target" ]; then
    rm -f "$target"
  fi
  ln -sf "$cmd_file" "$target"
done

# Install hooks (symlink each hook script, make executable)
echo "  → Installing hooks..."
HOOKS_INSTALLED=0
for hook_file in "$INSTALL_DIR/hooks"/*.sh; do
  [ -f "$hook_file" ] || continue
  hook_name=$(basename "$hook_file")
  target="$HOOKS_DIR/$hook_name"
  if [ -L "$target" ] || [ -f "$target" ]; then
    rm -f "$target"
  fi
  chmod +x "$hook_file"
  ln -sf "$hook_file" "$target"
  HOOKS_INSTALLED=$((HOOKS_INSTALLED + 1))
done

# Install settings template (only if user doesn't already have one)
SETTINGS_STATUS="skipped (already exists)"
if [ ! -f "$SETTINGS_FILE" ]; then
  if [ -f "$INSTALL_DIR/skill/templates/settings.json" ]; then
    echo "  → Installing settings template..."
    cp "$INSTALL_DIR/skill/templates/settings.json" "$SETTINGS_FILE"
    SETTINGS_STATUS="installed"
  fi
else
  echo "  → Settings template already exists, skipping..."
fi

echo ""
echo "  ✓ Skill installed at $SKILL_DIR"
echo "  ✓ Agents installed at $AGENTS_DIR"
echo "  ✓ Commands installed at $COMMANDS_DIR"
echo "  ✓ Hooks installed at $HOOKS_DIR ($HOOKS_INSTALLED hooks)"
echo "  ✓ Settings template: $SETTINGS_STATUS"
echo ""
echo "  Departments installed:"
for dept_dir in "$INSTALL_DIR/agents"/*/; do
  dept_name=$(basename "$dept_dir")
  agent_count=$(find "$dept_dir" -name "*.md" | wc -l | tr -d ' ')
  echo "    • $dept_name ($agent_count agents)"
done
echo ""
echo "  Commands installed:"
echo "    • /cofounder — Start a session"
for cmd_file in "$INSTALL_DIR/skill/commands"/*.md; do
  cmd_name=$(basename "$cmd_file" .md)
  echo "    • /$cmd_name"
done
echo ""
echo "  Get started:"
echo "    1. Open Claude Code in any project"
echo "    2. Type /cofounder"
echo "    3. Follow the setup to configure your company context"
echo ""
echo "  Update anytime: cd ~/.cofounder && git pull"
echo ""
