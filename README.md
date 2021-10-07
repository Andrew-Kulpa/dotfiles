# Dotfiles

## Installation
On a fresh Mac:
```
sudo softwareupdate -i -a
xcode-select --install
```

```
git clone https://github.com/andrew-kulpa/dotfiles.git ~/.dotfiles
cd dotfiles
./install.sh

```

## Customize
The `*.sh` files can be automatically executed from `~/.local/system/`.

## Why `runcom`?
> [Unix: from runcom files on the CTSS system 1962-63, via the startup script /etc/rc]
>
> Script file containing startup instructions for an application program (or an entire operating system), usually a text file containing commands of the sort that might have been invoked manually once the system was running but are to be executed automatically each time the system starts up.
> 
> Thus, it would seem that the "rc" part stands for "runcom", which I believe can be expanded to "run commands". In fact, this is exactly what the file contains, commands that bash should run.

## Credits
Many thanks to the [dotfiles community](https://dotfiles.github.io/).