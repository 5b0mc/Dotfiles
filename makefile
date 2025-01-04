.PHONY: work sway i3 font

work:
	# remember to install fzf and ripgrep!
	-git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	stow --verbose --target=$(HOME)/.config --restow nvim
	stow --verbose --target=$(HOME)/.config --restow terminals
	stow --verbose --target=$(HOME) --restow npm

sway:
	stow --verbose --target=$(HOME)/.config --restow sway
#	stow --verbose --target=$(HOME)/.config --restow hyprland

i3:
	stow --verbose --target=$(HOME)/.config --restow i3
	stow --verbose --target=$(HOME) --restow Xorg

font:
	stow --verbose --target=$(HOME)/.config --restow fonts
	wget -O /tmp/font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Ubuntu.zip
	unzip /tmp/font.zip -d /tmp/font
	rm /tmp/font.zip
	rm -rf /tmp/font
	cp -R /tmp/font/ ~/.local/share/fonts/
	wget -O /tmp/font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
	unzip /tmp/font.zip -d /tmp/font
	cp -R /tmp/font/ ~/.local/share/fonts/
	rm /tmp/font.zip
	rm -rf /tmp/font
	fc-cache -f -v
	
