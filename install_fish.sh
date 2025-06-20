sudo apt install fish

sudo -u root chsh -s /usr/bin/fish
chsh -s /usr/bin/fish

mv ~/.config/fish ~/.config/fish~
ln -sf $(pwd)/fish/ ~/.config/

