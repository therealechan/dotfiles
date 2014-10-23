```ascii
 ____            __       ___      ___                    
/\  _`\         /\ \__  /'___\ __ /\_ \                   
\ \ \/\ \    ___\ \ ,_\/\ \__//\_\\//\ \      __    ____  
 \ \ \ \ \  / __`\ \ \/\ \ ,__\/\ \ \ \ \   /'__`\ /',__\ 
  \ \ \_\ \/\ \L\ \ \ \_\ \ \_/\ \ \ \_\ \_/\  __//\__, `\
   \ \____/\ \____/\ \__\\ \_\  \ \_\/\____\ \____\/\____/
    \/___/  \/___/  \/__/ \/_/   \/_/\/____/\/____/\/___/ 
                                                          
                                                          

```

This dotfiles base on [Ryan Bates dotfiles](https://github.com/ryanb/dotfiles), custom by me.

I am running on Mac OS X.


## Installation

Run the following commands in your terminal. It will prompt you before it does anything destructive. Check out the [Rakefile](https://github.com/chankaward/dotfiles/blob/master/Rakefile) to see exactly what it does.

### Install Dotfiles
```terminal
git clone git@github.com:chankaward/dotfiles.git ~/.dotfiles
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

To remove the dotfiles configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.

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
