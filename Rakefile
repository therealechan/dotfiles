require 'rake'
require 'erb'

desc "Install dotfiles to your's home directory"
task :install do

  puts "-------------------------------------------------------------"
  puts "                    Homebrew section"
  puts "-------------------------------------------------------------"
  # homebrew section
  if RUBY_PLATFORM.downcase.include?("darwin")
    install_homebrew
    brew_tasks
    puts
    install_rbenv
    install_terminal_notifier
    install_macvim
  end
  puts

  puts "-------------------------------------------------------------"
  puts "                      Zsh section"
  puts "-------------------------------------------------------------"
  # zsh section
  install_oh_my_zsh
  install_zsh_syntax_highlighting
  switch_to_zsh
  puts

  puts "-------------------------------------------------------------"
  puts "                      Font section"
  puts "-------------------------------------------------------------"
  install_fonts
  puts

  puts "-------------------------------------------------------------"
  puts "                  File operation section"
  puts "-------------------------------------------------------------"
  # files operation
  replace_all = false
  files = grep_dir_files
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "Identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        override_or_skip_file(file)
      end
    else
      link_file(file)
    end
  end
end

desc "Update the latest dotfiles"
task :update do
  system 'git pull origin master && rake install'
end

def override_or_skip_file(file)
  puts "Overwrite ~/.#{file.sub(/\.erb$/, '')}? [y]es, [n]o, [a]ll, [e]xit   "
  case $stdin.gets.chomp
  when 'a'
    replace_all = true
    replace_file(file)
  when 'y'
    replace_file(file)
  when 'e'
    exit
  else
    puts "Skipping ~/.#{file.sub(/\.erb$/, '')}"
  end
end

def grep_dir_files
  files = Dir['*'] - %w[Rakefile README.md LICENSE.md oh-my-zsh fonts install.sh]
  files << "oh-my-zsh/custom/vpn.zsh"
  files << "oh-my-zsh/custom/chankaward.zsh-theme"
  files
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "Generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  elsif file =~ /zshrc$/ # copy zshrc instead of link
    puts "Copying ~/.#{file}"
    system %Q{cp "$PWD/#{file}" "$HOME/.#{file}"}
  else
    puts "Linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "Using zsh"
  else
    puts "Switch to zsh? (recommended) [y]es, [n]o, [e]xit  "
    case $stdin.gets.chomp
    when 'y'
      puts "Switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'e'
      exit
    else
      puts "Skipping zsh"
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "Found ~/.oh-my-zsh"
  else
    puts "Install oh-my-zsh? [y]es, [n]o, [e]xit  "
    case $stdin.gets.chomp
    when 'y'
      puts "Installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'e'
      exit
    else
      puts "Skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

def install_zsh_syntax_highlighting
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh/custom/plugins/zsh-syntax-highlighting"))
    puts "Found ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
  else
    puts "Install zsh-syntax-highlighting? [y]es, [n]o, [e]xit  "
    case $stdin.gets.chomp
    when 'y'
      puts "Install zsh-syntax-highlighting"
      system %Q{git clone git://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"}
    when 'e'
      exit
    else
      puts "Skipping zsh-syntax-highlighting, you will need to change ~/.oh-my-zsh/custom/plugins"
    end
  end
end

def install_fonts
  puts "Installing custom font"
  system %Q{cp -f $HOME/.dotfiles/fonts/* $HOME/Library/Fonts}
end

# terminal notifier
def install_terminal_notifier
  system %Q{brew install terminal-notifier}
  system %Q{brew link terminal-notifier}
  system %Q{brew install --HEAD https://raw.githubusercontent.com/chankaward/tn/master/tn.rb}
end

# The missing package manager for OS X
def install_homebrew
  print "Found "
  system %Q{which brew}
  unless $?.success?
    puts "Installing homebrew and packages..."
    system %Q{ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"}
  else
    puts "You already have homebrew!"
  end
  install_homebrew_packages
end

def install_homebrew_packages
  puts "Install homebrew packages? [y]es, [n]o, [e]xit  "
  case $stdin.gets.chomp
  when 'y'
    system %Q{brew install autojump git leiningen mysql node tig tree tmux imagemagick git-extras the_silver_searcher}
  when 'e'
    exit
  else
    puts "Skipping install homebrew packages"
  end
end

def brew_tasks
  system %Q{brew doctor}
  system %Q{brew update}
  system %Q{brew upgrade}
  system %Q{brew linkapps}
  system %Q{brew cleanup}
end

def install_rbenv
  puts "WARNING: rbenv is incompatible with RVM. Please make sure to fully uninstall RVM and remove any references to it from your shell initialization files before installing rbenv."
  puts
  puts "Install rbenv? [y]es, [n]o, [e]xit  "
  case $stdin.gets.chomp
  when 'y'
    system %Q{brew install rbenv ruby-build}
    install_rbenv_plugins
  when 'e'
    exit
  else
    puts "Skipping install rbenv"
  end
end

def install_rbenv_plugins
  puts "Installing rbenv plugins"
  system %Q{brew install rbenv-communal-gems rbenv-gem-rehash}
end

def install_macvim
  puts "Installing macvim"
  system %Q{brew install macvim --custom-icons --override-system-vim --with-lua --with-luajit}
  system %Q{brew link macvim}
  install_vundle
end

# vim plugin manager
def install_vundle
  if File.exist?(File.join(ENV['HOME'], ".vim/bundle/Vundle.vim"))
    puts "Found ~/.vim/bundle/Vundle.vim"
  else
    puts "Installing vundle"
    system %Q{git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim}
  end
end
