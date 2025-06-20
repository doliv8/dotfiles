sudo apt install fish

sudo -u root chsh -s /usr/bin/fish
chsh -s /usr/bin/fish

# create user conf
if [ -d "~/.config/fish" ]; then
	mv ~/.config/fish ~/.config/fish~
	echo "Backup of existing fish config has been created"
fi
ln -sf $(pwd)/fish/ ~/.config/

# create root conf
if [ -d "/root/.config/fish" ]; then
	sudo mv /root/.config/fish /root/.config/fish~
	echo "Backup of existing root fish config has been created"
fi
sudo ln -sf $(pwd)/fish/ /root/.config/

