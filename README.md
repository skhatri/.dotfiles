# dotfiles (.tilde)

Just my personal configs and scripts for mac, zsh, vim, and git. Heavily tailored for working with kubernetes and docker.

## Install

Clone this into `~/dev/projects/.tilde` and run the installer to symlink everything up.

```bash
cd ~/dev/projects/.tilde
./install.sh
```
(It safely backs up your existing dotfiles first so it won't destroy anything).

## Highlights
- **prompt:** simple one-line zsh prompt with clean/dirty git indicators and a day/night icon.
- **git:** lots of aliases (`git nuke`, `git undo`) and a global gitignore so I don't have to keep ignoring `.DS_Store` everywhere.
- **docker/k8s:** shortcuts for jumping around namespaces (`ksw`), context switching (`kx`), and bulk-cleaning dangling images (`rmdock`).
- **macOS:** a `Brewfile` to bootstrap a new laptop fast.
