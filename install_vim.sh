sudo apt install vim-gtk3

# install vundle
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -sfb $(pwd)/vim/.vimrc ~/.vimrc

vim +PluginInstall +qall

