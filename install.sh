ln -sf --backup $PWD/.vimrc ~/.vimrc

# vim update 
sudo apt-get update
sudo apt-get install vim

# zsh, oh-my-zsh 
apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install Vim Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -sf --backup $PWD/.zshrc ~/.zshrc

# install  node.js
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
