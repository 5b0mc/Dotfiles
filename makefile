all:
	stow --verbose --target=$(HOME)/.config --restow nvim
	stow --verbose --target=$(HOME)/.config --restow tmux
	stow --verbose --target=$(HOME)/.config --restow fish
	stow --verbose --target=$(HOME)/.config --restow alacritty
	stow --verbose --target=$(HOME)/.config --restow i3

delete:
	#stow --verbose --target=$(HOME) --delete */
