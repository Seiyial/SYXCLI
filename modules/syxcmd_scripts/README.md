# SYXCMD Scripts Directory

If SYXCMD is enabled, in *this* directory and 1st-level subdirectories will be included in the **`PATH`**. In other words, they can be executed directly by entering the filename, regardless of your working directory.

Ensure that all files here are executable. They are not by default. To make a file executable,
1) run `$ chmod +x path/to/file` on the file, and
2) ensure the file starts with the bash (or other) shebang, which looks like this:-

###### syxcmd_scripts/example_script (no need file extension)
```bash
#!/usr/bin/env bash
# ^^^ this is the shebang that ensures the file is run using /usr/bin/env bash, which resolves to bash on all common OSes.

# do some bash scripts...
```

Thus, to add a new script of your own,
1) Add a file in *this* folder named after the script name e.g. `$ touch git_special` (do not put file extension)
2) `$ chmod +X ./git_special`
3) `$ echo "#!/usr/bin/env bash" > git_special`
4) Edit `./git_special` and put in your script instructions.
5) Reload your terminal's `SYXCMD` and try to run `$ git_special`.