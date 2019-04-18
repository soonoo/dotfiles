sudo -v

ln -sf --backup $PWD/.vimrc ~/.vimrc

# install git and config user
sudo apt install git
ln -sf --backup $PWD/.gitconfig ~/.gitconfig

# vim update 
sudo apt-get update
sudo apt-get install vim

# zsh, oh-my-zsh 
sudo apt install zsh
sudo apt install curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install Vim Vundle and plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
ln -sf --backup $PWD/.zshrc ~/.zshrc

# install  node.js
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# install tmux
sudo apt install tmux
ln -sf --backup $PWD/.tmux.conf ~/.tmux.conf
