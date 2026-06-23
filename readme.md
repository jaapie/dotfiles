# Jaapie's Dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Install

```bash
git clone git@github.com:jaapie/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow bash git tmux shellcolour ack dircolors editorconfig screen jslint
```

## Structure

Each subdirectory is a stow package. Files inside mirror their destination under `$HOME`:

| Package | Contents |
|---|---|
| `bash` | `.bashrc`, `.bash_profile`, `.bashrc_local_Darwin`, `.bashrc_local_Linux` |
| `git` | `.gitconfig`, `.gitignore_global` |
| `tmux` | `.tmux.conf`, `.tmux-linux.conf`, `.tmux-macos.conf` |
| `shellcolour` | `.shellcolour/` — base16 terminal colour schemes |
| `ack` | `.ackrc` |
| `dircolors` | `.dircolors` |
| `editorconfig` | `.editorconfig` |
| `screen` | `.screenrc` |
| `jslint` | `.jslintrc` |

## Shell colour schemes

Switch themes with the `sc` command:

```bash
sc catppuccin dark   # Catppuccin Mocha
sc catppuccin light  # Catppuccin Latte
sc list              # show all available themes
sc ocean dark        # example: Base16 Ocean
```

The active theme persists across sessions via `~/.shellcolourrc`.

## Neovim

Neovim config lives in a separate repo.
