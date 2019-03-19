syxcli_run_installer () {
	echo "

SYXCLI Installation

There are a few ways to install SYXCLI.

(Method 1)
Set it up to activate Automatically on the start of the
shell session, using ~/.bash_profile or ~/.zshrc.

(Method 2)
Create an alias in ~/.bash_profile or ~/.zshrc that you can call
when you'd like. Calling the alias would activate SYXCLI.

(Method 3)
Don't do anything (instructions will be provided
on how to activate SYXCLI)

        (1/2/3/skip)
  >> ✡  "
	read syxcli_installer_choice

	# WIP
}