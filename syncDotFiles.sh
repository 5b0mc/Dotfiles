dirname=`dirname $0`
ln "$dirname"/tmux.conf ~/.tmux.conf --force
ln "$dirname"/zshrc ~/.zshrc --force
ln "$dirname"/init.lua ~/.config/nvim/init.lua --force
ln "$dirname"/lua/options.lua ~/.config/nvim/lua/options.lua --force
ln "$dirname"/lua/mappings.lua ~/.config/nvim/lua/mappings.lua --force
ln "$dirname"/lua/plugins.lua ~/.config/nvim/lua/plugins.lua --force
ln "$dirname"/lua/setups.lua ~/.config/nvim/lua/setups.lua --force
