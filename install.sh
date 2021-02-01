#!/bin/bash
# This script installs neovim and configures it.
# First, we need to download and then configure neovim.
# I am going to install neovim to the /usr/local/bin directory
variables () {
	export root_dir=$(pwd)
	export config_dir=${root_dir}/config/
	export bin_dir="/usr/local/bin"
	export nvim_dir="${HOME}/.config/nvim/"
	export nvim_url="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz"
	export vimplug_url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
}
neovim_install () {
	cd ${bin_dir}
	wget ${nvim_url}
	tar zxvf nvim-linux64.tar.gz
	echo "export PATH=${nvim_dir}:$PATH" >> ${HOME}/.bashrc
	echo "alias vim='nvim'" >> ${HOME}/.bashrc
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs ${vimplug_url}'
}
neovim_configure () {
	mkdir ${nvim_dir} -p
	cp ${config_dir}/init.vim 
	nvim --headless +PlugInstall +qall
}
youcompleteme_configure () {
	mkdir ${nvim_dir}/bundle -p
	cd ${nvim_dir}/bundle/
	git clone https://github.com/ycm-core/YouCompleteMe.git
	git submodule update --init --recursive
	python3 install.py --clangd-completer
}
variables
neovim_install
youcompleteme_configure
neovim_configure
