sudo apt install gdb gdb-multiarch

# install pwndbg
git clone -b "bump-version" --depth=1 https://github.com/pwndbg/pwndbg ~/.pwndbg

(
cd ~/.pwndbg
./setup.sh
)

# install bata24 gef for root
wget -q https://raw.githubusercontent.com/bata24/gef/dev/install-uv.sh -O- | sudo sh
