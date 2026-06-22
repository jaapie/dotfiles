# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal dotfiles for Jacob Degeling, managed with GNU Stow. Files live in named package subdirectories that mirror the target structure under `$HOME`.

## Installing / managing dotfiles

Requires GNU Stow (`apt install stow`). Run from the repo root:

```bash
stow bash git tmux shellcolour   # link specific packages
stow -D bash                     # unlink a package
stow -R bash                     # re-link after moving files
```

Package layout: `<package>/<dotfile>` → `~/<dotfile>`. For example `bash/.bashrc` → `~/.bashrc`. The `shellcolour` package links the whole `.shellcolour/` directory.

To add a new dotfile: create `<package>/.<filename>`, then `stow <package>`.

## Shell startup chain

`~/.bash_profile` → sources `~/.bashrc` (`bash/.bashrc`) → sources `~/.bashrc_local_${OS}` (`bash/.bashrc_local_Darwin` or `bash/.bashrc_local_Linux`) → sources `~/.bashrc_local` (not tracked, machine-specific)

To profile startup slowness, temporarily re-enable the tracing block at the top of `bash/.bashrc` (`PS4=...`, `exec 3>&2...`, `set -x`) and read `/tmp/bashstart.<PID>.log`.

## Tmux

Prefix is `C-Space`. Platform-specific config is sourced at the end of `tmux/.tmux.conf`:
- `tmux/.tmux-macos.conf` on Darwin
- `tmux/.tmux-linux.conf` on Linux

## Shell colour scheme system

Themes live in `shellcolour/.shellcolour/` as `base16-<name>.<dark|light>.sh`. The active theme is stored in `~/.shellcolourrc`. Commands:

```bash
sc <name> [dark|light]   # switch theme (default: light)
sc list                  # list available themes
sc off                   # disable
```

Tab completion is wired up for `sc`. The `bash/.bashrc` loads the saved theme on startup via `sc $(cat ~/.shellcolourrc || echo ocean)`.

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

