sudo apt install fish

sudo -u root chsh -s /usr/bin/fish
chsh -s /usr/bin/fish

if [ -L "~/.config/fish" ]; then
	mv ~/.config/fish ~/.config/fish~
	echo "Backup of existing fish config has been created"
fi
ln -sf $(pwd)/fish/ ~/.config/

