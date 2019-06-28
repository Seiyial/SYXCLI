# SYXCMD Aliases Folder

All files and subdirectory files in this folder will be `source`d.
This means that you can put aliases or perform other actions in these files that will be included into your shell session when SYXCMD is loaded.

For example, if you'd like to have an alias that does `$ git add . && git commit`, callable by the alias command `gac` do this:

```bash
$ touch ./new_git_aliases.sh
$ echo 'alias gac="git add . && git commit"' >> ./new_git_aliases.sh
$ exit

# Reload SYXCMD
$ gac
```