sudo apt-get install fuse libfuse2 git python3-pip ack-grep -y
wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
chmod +x nvim
sudo chown root:root nvim
sudo mv nvim /usr/bin
cd ~
mkdir -p .config/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install --user neovim
touch ~/.config/nvim/init.vim
echo -e"call plug#begin()\n\
Plug 'roxma/nvim-completion-manager'\n\
Plug 'SirVer/ultisnips'\n\
Plug 'honza/vim-snippets'\n\
call plug#end()"
nvim

