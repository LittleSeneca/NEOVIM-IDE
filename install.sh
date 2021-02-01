#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
# This script installs neovim and configures it.
# First, we need to download and then configure neovim.
# I am going to install neovim to the /usr/local/bin directory
variables () {
	echo "Setting Variables"
	export root_dir=$(pwd)
	export config_dir=${root_dir}/config/
	export user_home=/home/littleseneca/
	export bin_dir="/usr/local/bin"
	export nvim_dir="${user_home}/.config/nvim/"
	export nvim_url="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz"
	export vimplug_url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	echo "Finished setting variables"
}
neovim_install () {
	echo "Installing NEOVIM"
	cd ${bin_dir}
	wget ${nvim_url}
	tar zxvf nvim-linux64.tar.gz
	echo "export PATH=${nvim_dir}:$PATH" >> ${HOME}/.bashrc
	echo "alias vim='nvim'" >> ${user_home}/.bashrc
	sh -c 'curl -fLo "${user_home}/.local/share}"/nvim/site/autoload/plug.vim --create-dirs ${vimplug_url}'
	echo "Finished Installing NOVIM"
}
neovim_configure () {
	mkdir ${nvim_dir} -p
	cp ${config_dir}/init.vim 
	nvim --headless +PlugInstall +qall
}
youcompleteme_configure () {
	echo "Installing You Complete Me Libraries"
	mkdir ${nvim_dir}/bundle -p
	cd ${nvim_dir}/bundle/
	apt install build-essential cmake vim-nox python3-dev -y
	apt install mono-complete golang nodejs default-jdk npm -y
	git clone --recurse-submodules git@github.com:ycm-core/YouCompleteMe.git 
	python3 install.py --clangd-completer
	echo "Finished Installing You Complete Me"
}
variables
neovim_install
youcompleteme_configure
neovim_configure
