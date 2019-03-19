<h1 style="color: darkcyan">SYX Command Line Tools (<code>SYXCLI</code>)</h1>

## Core Package

`SYXCLI` is a list of command line utilities that can help to make developer life easier.

## Modules

`SYXCLI` is made up of a few modules, namely:

### SYXCMD

Your personal collection of shell scripts and aliases. Cleanly share them across the different workstations that you use.

Features:-

- Organise your personal scripts
- Optionally include built-in scripts
- Auto-enable on your PC, one command to enable everything on shared workspaces (per shell session)
- Easy to configure and enable/disable

Enable `SYXCMD`

### SYXDIRLINK `(new)`

Organise your home directory. Set up shortcuts to your favourite/current projects.

#### Enable this Module

```bash
# ~/.zshrc
export SYXCLI_DIRS=true

# /path/to/your/workspace_root
export SYXCLI_DIRS_MAIN=

# /
```
