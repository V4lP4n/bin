#Install Nvim if needed and update plugin configuration
plugs="call plug#begin()\n\
Plug 'roxma/nvim-completion-manager'\n\
Plug 'SirVer/ultisnips'\n\
Plug 'honza/vim-snippets'\n\
Plug 'jacobsimpson/nvim-example-python-plugin'\n\
Plug 'stephpy/vim-yaml'\n\
call plug#end()" 


if ! [ -f $(which nvim) ]
then
	sudo apt-get install fuse libfuse2 git python3-pip ack-grep -y
	wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
	chmod +x nvim
	sudo chown root:root nvim
	sudo mv nvim /usr/bin
	pip3 install --user neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

cd ~
mkdir -p .config/nvim
touch ~/.config/nvim/init.vim
echo -e $plugs > ~/.config/nvim/init.vim

sed -i.bu 's/async=True/**{"async": True}/' ~/.config/nvim/plugged/nvim-completion-manager/pythonx/cm.py
sed -i.bu 's/async=True/**{"async": True}/' ~/.config/nvim/plugged/nvim-completion-manager/pythonx/cm_core.py

