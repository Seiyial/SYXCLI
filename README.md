<h1 style="color: darkcyan">SYX Command Line Tools (<code>SYXCLI</code>)</h1>

A package of command line apps that seriously make your life easier :)
Enable selectively, and customise them to fit your Dev life :)

#### The Tools (they can be selectively enabled/disabled):
**SYXCMD**: Easily handle your collection of personal scripts and aliases, and much more!
**TP**: Teleport almost instantly to your current projects, anytime. Super customisable.

## Installation
```bash
$ git clone https://github.com/Seiyial/SYXCLI.git ~/.SYXCLI # but anywhere comfy works as well!
$ ~/.SYXCLI/bin/syxcli
# follow the instructions
# See below for configuring your SETTINGS to your SYXCLI liking :)
```

## Enabling of Modules

#### Global

SYXCLI supports a few installation modes.
1. **Extensive**: recommended for your personal laptop. Puts 3 lines into your `~/.zshrc`/`~/.bashrc`/etc and runs on every terminal session, automatically for you.
2. **Stealth**: recommended for devices that don't 100% belong to you. Sets up everything but nothing goes into the `~/.zshrc`/`~/.bashrc`/etc that'll make your seniors panic. Activate `SYXCLI` only when you need it by running `$ /path/to/your_syxcli/bin/syxcli autorun --verbose`.
3. **Selective**: something in between. Puts 3 lines in `~/.zshrc`/`~/.bashrc`/etc but doesn't activate. Activate when you need it by simply running `$ youralias`.

Choose the one that fits you best!

#### SYXCMD

- Easily handle your collection of personal scripts and aliases by keeping them within `syxcli/modules/syxcmd_scripts` and `syxcli/modules/syxcmd_aliases`.
- `scripts` folder will be in the `PATH`. (optional)
- `aliases` folder will be `source`d. (optional)
- Set your settings in the setup or by opening `your_syxcli_folder/SYXCLI_SETTINGS` afterwards. Changes apply on your very next (`SYXCLI`-enabled) session :)

```bash
syxcmd_enable=true
# Set to blank or "" if you'd like to completely not run SYXCMD at all.
# Otherwise, set to "true".

syxcmd_use_aliases=true
# true: all files in aliases folder will be sourced.
# "" (blank): all files in aliases folder will NOT be sourced.

syxcmd_use_scripts=true
# true: the scripts folder (SYXCLI/modules/syxcmd_scripts)
# "" (blank): scripts folder will be in the PATH.
```

#### Tool #2 (NEW!): `SYX TELEPORT`

> Unlimited teleportation scrolls for your ingame character, just that it's the terminal and your project folders. But still :)

- **BEFORE** you start using `SYX_TELEPORT`, copy `your_syxcli_folder/modules/syxcli_core/templates/PROJECT_LIST` to `your_syxcli_folder/PROJECT_LIST`. Edit the file `your_syxcli_folder/PROJECT_LIST` to list your desired projects, adhering to the syntax.
- Set your settings in the setup or by opening `your_syxcli_folder/SYXCLI_SETTINGS` afterwards. Changes apply on your very next (`SYXCLI`-enabled) session :)

```bash
syxdlink_enable=true
# true: enable SYX TELEPORT
# "" (blank): disable SYX TELEPORT

syxdlink_aliases=("p" "tp")
# a list of your desired TELEPORT commands.
# e.g. ("tp") : you can use `tp` to run the teleporter
# e.g. ("tp" "teleport") : you can use any of `tp` and `teleport` to run the teleporter.
```

Happy Teleporting!!