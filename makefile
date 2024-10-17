work:
	# remember to intall make and ripgrep for telescope plugin
	-git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	stow --verbose --target=$(HOME)/.config --restow nvim
	stow --verbose --target=$(HOME)/.config --restow tmux
	stow --verbose --target=$(HOME)/.config --restow fish
	stow --verbose --target=$(HOME)/.config --restow alacritty
	stow --verbose --target=$(HOME) --restow npm

linux:
	stow --verbose --target=$(HOME)/.config --restow sway
	stow --verbose --target=$(HOME)/.config --restow i3
	stow --verbose --target=$(HOME)/.config --restow hyprland
	stow --verbose --target=$(HOME) --restow Xorg

font:
	wget -O /tmp/font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
	unzip /tmp/font.zip -d /tmp/font
	cp -R /tmp/font/ ~/.local/share/fonts/
	fc-cache -f -v
	rm /tmp/font.zip
	rm -rf /tmp/font
