# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal dotfiles for Jacob Degeling. Files prefixed with `_` get symlinked into `$HOME` as dotfiles, with the `_` replaced by `.` (e.g., `_bashrc` → `~/.bashrc`).

## Installing / managing dotfiles

Run `./dotfiles` from the repo root. It must be run from within the repo directory since it uses `$(pwd)/_*` to find files.

```
./dotfiles          # link all _* files (skips existing)
./dotfiles -f       # force overwrite existing links
./dotfiles -n       # dry run - show what would happen
./dotfiles -u       # uninstall (remove links)
```

The script creates symlinks for every `_*` file/directory, including `_shellcolour/` (the whole directory gets linked as `~/.shellcolour`).

## Shell startup chain

`~/.bash_profile` → sources `~/.bashrc` (`_bashrc`) → sources `~/.bashrc_local_${OS}` (`_bashrc_local_Darwin` or `_bashrc_local_Linux`) → sources `~/.bashrc_local` (not tracked, machine-specific)

## Known issue: debug tracing left active in `_bashrc`

Lines 9–11 of `_bashrc` enable bash tracing to `/tmp/bashstart.$$.log`:

```bash
PS4='+ $(date "+%s.%N")\011 '
exec 3>&2 2>/tmp/bashstart.$$.log
set -x
```

The corresponding cleanup at the bottom (lines 425–426) is commented out:

```bash
# set +x
# exec 2>&3 3>&-
```

This is the primary cause of slow shell startup — every command in `.bashrc` is traced with nanosecond timestamps. To profile startup, read `/tmp/bashstart.<PID>.log`. To fix, either uncomment those two lines or remove the tracing block entirely.

## Vim / Neovim

The `_vimrc` and `_vim/` config is deprecated and will be removed. Neovim config lives in a separate repo.

## Tmux

Prefix is `C-Space`. Platform-specific config is sourced at the end of `_tmux.conf`:
- `_tmux-macos.conf` on Darwin
- `_tmux-linux.conf` on Linux

## Shell colour scheme system

Themes live in `_shellcolour/` as `base16-<name>.<dark|light>.sh`. The active theme is stored in `~/.shellcolourrc`. Commands:

```bash
sc <name> [dark|light]   # switch theme (default: light)
sc list                  # list available themes
sc off                   # disable
```

Tab completion is wired up for `sc`. The `_bashrc` loads the saved theme on startup via `sc $(cat ~/.shellcolourrc || echo ocean)`.

## Prompt system

The prompt style is saved to `~/.prompt` and restored across sessions. Switch with:

```bash
prompt -m   # minimal: just $
prompt -b   # basic: cwd + $
prompt -g   # basic + git branch
prompt -f   # full: user@host in cwd on branch $
```

A red dot prefix is shown when a reboot is pending (`/var/run/reboot-required` exists, Linux only).

## Commit conventions

Follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#specification). Format: `type(scope): short summary` — 50 char limit on the summary line.

Common types: `feat`, `fix`, `chore`, `refactor`, `docs`, `style`, `perf`.

Commit often at strategic points: after each logical change is working, before starting a related-but-distinct change, and before any risky refactor.

## Planned migration: stow

The intent is to replace the custom `dotfiles` script with GNU Stow. Stow expects a package directory structure where files mirror their destination paths relative to `$HOME`. This will require reorganising files (e.g., `bash/.bashrc`, `vim/.vimrc`) rather than the current flat `_`-prefixed layout.
