# My dotfile

This dotfile base from Ryan Bates dotfile, custom by me.
These are config files to set up a system the way I like it. It now uses [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh). If you would like to see my old, custom Bash and ZSH config, check out [this branch](https://github.com/ryanb/dotfiles/tree/custom-bash-zsh)

I am running on Mac OS X, but it will likely work on Linux as well.


## Installation

Run the following commands in your terminal. It will prompt you before it does anything destructive. Check out the [Rakefile](https://github.com/ryanb/dotfiles/blob/custom-bash-zsh/Rakefile) to see exactly what it does.

### Install Dotfiles
```terminal
git clone git@github.com:chankaward/.dotfile.git ~/.dotfiles
cd ~/.dotfiles
rake install
```
### Install Vim Plugins
``` terminal
cd ~/.dotfiles
mvim vimrc
```
in ```vimrc``` run
```terminal
PluginInstall
```

After installing, open a new terminal window to see the effects.

Feel free to customize the .zshrc file to match your preference.

## Uninstall

To remove the dotfile configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.

```
unlink ~/.bin
unlink ~/.gitignore
unlink ~/.gemrc
unlink ~/.gvimrc
unlink ~/.irbrc
unlink ~/.vim
unlink ~/.vimrc
rm ~/.zshrc # careful here
rm ~/.gitconfig
rm -rf ~/.dotfiles
rm -rf ~/.oh-my-zsh
chsh -s /bin/bash # change back to Bash if you want
```

Then open a new terminal window to see the effects.

--------------------------
Also you can use my iTerm2 [colorscheme](https://github.com/chankaward/railscasts-iterm2) if you like it
