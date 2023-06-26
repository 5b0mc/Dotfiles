all:
	stow --verbose --target=$(HOME)/.config --restow nvim
	stow --verbose --target=$(HOME)/.config --restow tmux
	stow --verbose --target=$(HOME)/.config --restow fish
	stow --verbose --target=$(HOME)/.config --restow alacritty

i3:
	stow --verbose --target=$(HOME)/.config --restow i3
	stow --verbose --target=$(HOME) --restow Xorg

delete:
	#stow --verbose --target=$(HOME) --delete */
