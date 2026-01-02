sudo apt install neovim

mkdir -p ~/.config/nvim

# create user conf
if [ -d "$HOME/.config/nvim" ]; then
	mv ~/.config/nvim ~/.config/nvim~
	echo "Backup of existing nvim config has been created"
fi
ln -sf $(pwd)/nvim/ ~/.config/

