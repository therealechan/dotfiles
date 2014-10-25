require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  install_homebrew_packages
  install_fonts
  install_oh_my_zsh
  install_zsh_syntax_highlighting
  switch_to_zsh
  install_vundle
  replace_all = false
  files = Dir['*'] - %w[Rakefile README.md LICENSE oh-my-zsh atom]
  files += Dir['atom/*']
  files << "oh-my-zsh/custom/vpn.zsh"
  files << "oh-my-zsh/custom/chankaward.zsh-theme"
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

def install_vundle
  if File.exist?(File.join(ENV['HOME'], ".vim/bundle/Vundle.vim"))
    puts "found ~/.vim/bundle/Vundle.vim"
  else
    system %Q{git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim}
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  elsif file =~ /zshrc$/ # copy zshrc instead of link
    puts "copying ~/.#{file}"
    system %Q{cp "$PWD/#{file}" "$HOME/.#{file}"}
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    print "switch to zsh? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      exit
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

def install_zsh_syntax_highlighting
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh/custom/plugins/zsh-syntax-highlighting"))
    puts "found ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
  else
    print "install zsh-syntax-highlighting? [ynq]"
    case $stdin.gets.chomp
    when 'y'
      puts "install zsh-syntax-highlighting"
      system %Q{git clone git://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"}
    when 'q'
      exit
    else
      puts "skipping zsh-syntax-highlighting, you will need to change ~/.oh-my-zsh/custom/plugins"
    end
  end
end

def install_homebrew_packages
  system %Q{which brew}
  unless $?.success?
    system %Q{ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"}
  else
    puts "looks you've already install Homebrew"
  end

  print "install homebrew packages? [ynq]"
  case $stdin.gets.chomp
  when 'y'
    puts "installing homebrew packages"
    system %Q{brew install autojump git leiningen mysql node tig tree tmux imagemagick git-extras the_silver_searcher}
    system %Q{brew install macvim --custom-icons --override-system-vim --with-lua --with-luajit}
  when 'q'
    exit
  else
    puts "skipping install homebrew packages"
  end
  puts "======================================================"
  puts "running 'brew linkapps'"
  puts "======================================================"
  system %Q{brew linkapps}
  puts
  puts "======================================================"
  puts "running 'brew update'"
  puts "======================================================"
  system %Q{brew update}
  puts
  puts "======================================================"
  puts "running 'brew doctor''"
  puts "======================================================"
  system %Q{brew doctor}
  puts
  puts "======================================================"
  puts "running 'brew upgrade'"
  puts "======================================================"
  system %Q{brew upgrade}
  system %Q{brew cleanup}
  puts
  puts "finish install homebrew packages"
end

def install_fonts
  puts "installing custom font."
  system %Q{cp -f $HOME/.dotfiles/fonts/* $HOME/Library/Fonts}
end
