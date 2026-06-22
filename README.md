# configs

Personal dotfiles for the terminal stack: zsh, tmux, alacritty, neovim.
Theme is **Gruvbox Dark Hard**, tuned for high contrast (keratoconus-friendly).

## Layout

```
alacritty/   alacritty.toml
nvim/        init.vim, coc-settings.json   (vim-plug, gruvbox, nerdtree, coc)
tmux/        .tmux.conf                     (tpm, gruvbox status line)
zsh/         .zshrc, .zprofile, .p10k.zsh, p10k-keratoconus.zsh
             oh-my-zsh/custom/*.zsh         (oh-my-zsh custom scripts)
Brewfile     installed tools, casks, fonts, VS Code extensions
bootstrap.sh provisions a fresh machine from this repo
```

## Bootstrap a new machine

```sh
git clone git@github.com:andrewhertog/configs.git ~/configs
~/configs/bootstrap.sh
```

The script:
1. Installs Homebrew, then runs `brew bundle` against the `Brewfile`.
2. Installs plugin managers: oh-my-zsh, powerlevel10k, tpm, vim-plug.
3. Copies configs into `~` and `~/.config` (existing files backed up to `*.bak`).
4. Installs neovim and tmux plugins.

Re-runnable and idempotent.

## Secrets

Secrets are **not** tracked. `zsh/.zshrc` sources `~/.zshrc.local`, which is
gitignored. After bootstrap, create it:

```sh
cat > ~/.zshrc.local <<'EOF'
export OPSLEVEL_TOKEN=...
EOF
```

## Updating the repo

This repo is a **snapshot** — edits in `~` do not sync back automatically.
After changing a live config, copy it back into the matching folder and commit.
Refresh the tool list with `brew bundle dump --file=Brewfile --force`.
