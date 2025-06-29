pip3 install pwntools --break-system-packages
pip install git+https://github.com/Church-17/pwnit.git --break-system-packages

if [ -d "$HOME/.config/pwnit" ]; then
	mv ~/.config/pwnit ~/.config/pwnit~
	echo "Backup of existing pwnit config has been created"
fi
ln -sf $(pwd)/pwnit/ ~/.config/

pip3 install ropper --break-system-packages
sudo apt install ruby
sudo gem install one_gadget

wget -q -O ~/.pwninit/pwninit https://github.com/io12/pwninit/releases/latest/download/pwninit
chmod +x ~/.pwninit/pwninit

