require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  install_oh_my_zsh
  install_zsh_autosuggestions
  install_zsh_syntax_highlighting
  switch_to_zsh
  replace_all = false
  files = Dir['*'] - %w[Rakefile README.rdoc LICENSE oh-my-zsh atom]
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
  system %Q{git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle}
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

def install_zsh_autosuggestions
  if File.exist?(File.join(ENV['HOME'], ".zsh-autosuggestions"))
    puts "found ~/.zsh-autosuggestions"
  else
    print "install zsh-autosuggestions? [ynq]"
    case $stdin.gets.chomp
    when 'y'
      puts "install zsh-autosuggestions"
      system %Q{git clone git://github.com/tarruda/zsh-autosuggestions "$HOME/.zsh-autosuggestions"}
    when 'q'
      exit
    else
      puts "skipping zsh-autosuggestions, you will need to change ~/.zsh-autosuggestions"
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
