return unless `type zsh`

git "#{ENV['HOME']}/.zprezto" do
    repository "git@github.com:sorin-ionescu/prezto.git"
    not_if "test -d #{ENV['HOME']}/.zprezto"
end

execute 'chsh -s /bin/zsh' do
  command "zsh; setopt EXTENDED_GLOB; command 'for rcfile in #{ENV['HOME']}/.zprezto/runcoms/^README.md(.N); do  ln -s $rcfile #{ENV['HOME']}/.${rcfile:t}  done"
  not_if "echo #{ENV['SHELL']} | grep zsh"
end

execute 'chsh -s /bin/zsh' do
  command 'chsh -s /bin/zsh'
  not_if "echo #{ENV['SHELL']} | grep zsh"
end
