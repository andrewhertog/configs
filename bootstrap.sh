#!/usr/bin/env bash
#
# Bootstrap a fresh macOS machine from this repo:
#   1. Install Homebrew + all tools (Brewfile)
#   2. Install plugin managers (oh-my-zsh, powerlevel10k, tpm, vim-plug)
#   3. Copy configs into place
#   4. Install editor/tmux plugins
#
# Re-runnable: safe to run multiple times. Existing dotfiles are backed up to
# <file>.bak before being overwritten.
#
# Secrets are NOT in this repo. After running, create ~/.zshrc.local for them:
#   export OPSLEVEL_TOKEN=...
#
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log()  { printf '\033[1;33m==>\033[0m %s\n' "$1"; }

# Copy src -> dst, backing up an existing dst to dst.bak first.
install_file() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    cp "$dst" "$dst.bak"
  fi
  cp "$src" "$dst"
  log "installed $dst"
}

# 1. Homebrew + tools ---------------------------------------------------------
if ! command -v brew >/dev/null 2>&1; then
  log "installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

log "installing tools from Brewfile"
brew bundle --file="$REPO_DIR/Brewfile"

# 2. Plugin managers ----------------------------------------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  log "installing oh-my-zsh"
  RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  log "installing powerlevel10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "$ZSH_CUSTOM/themes/powerlevel10k"
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  log "installing tpm (tmux plugin manager)"
  git clone --depth=1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  log "installing vim-plug"
  curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# 3. Configs ------------------------------------------------------------------
install_file "$REPO_DIR/zsh/.zshrc"                "$HOME/.zshrc"
install_file "$REPO_DIR/zsh/.zprofile"             "$HOME/.zprofile"
install_file "$REPO_DIR/zsh/.p10k.zsh"             "$HOME/.p10k.zsh"
install_file "$REPO_DIR/zsh/p10k-keratoconus.zsh"  "$HOME/.config/zsh/p10k-keratoconus.zsh"
for f in "$REPO_DIR"/zsh/oh-my-zsh/custom/*.zsh; do
  [ -e "$f" ] && install_file "$f" "$ZSH_CUSTOM/$(basename "$f")"
done

install_file "$REPO_DIR/tmux/.tmux.conf"           "$HOME/.tmux.conf"
install_file "$REPO_DIR/alacritty/alacritty.toml"  "$HOME/.config/alacritty/alacritty.toml"
install_file "$REPO_DIR/nvim/init.vim"             "$HOME/.config/nvim/init.vim"
install_file "$REPO_DIR/nvim/coc-settings.json"    "$HOME/.config/nvim/coc-settings.json"

# 4. Editor / tmux plugins ----------------------------------------------------
if command -v nvim >/dev/null 2>&1; then
  log "installing neovim plugins"
  nvim --headless +PlugInstall +qall 2>/dev/null || true
fi
log "installing tmux plugins"
"$HOME/.tmux/plugins/tpm/bin/install_plugins" 2>/dev/null || true

log "done."
echo
echo "  Next steps:"
echo "    1. Create ~/.zshrc.local with your secrets (e.g. export OPSLEVEL_TOKEN=...)."
echo "    2. Restart your shell:  exec zsh"
