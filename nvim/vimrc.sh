# config
echo '"config' >> .vimrc
echo '' >> .vimrc
## opts
cat lua/config.lua | grep "vim.opt" | grep 'true' | sed "s/vim.opt./set /g" >> .vimrc
cat lua/config.lua | grep "vim.opt" | grep 'false' | sed "s/vim.opt./set no/g" >> .vimrc
sed -i "s/ = .*//g" .vimrc
cat lua/config.lua | grep "vim.opt" | grep " = '" | sed "s/vim.opt./set /g" >> .vimrc
## special config
sed -i "s/set path=/set path+=/g" .vimrc
sed -i "s/set wildignore=/set wildignore+=/g" .vimrc
sed -i "s/set lcs=/set lcs+=/g" .vimrc
## vars
cat lua/config.lua | grep "vim.g." | sed "s/vim.g./let g:/g" >> .vimrc
## commands
cat lua/config.lua | grep "vim.api.nvim_command" | sed "s/vim.api.nvim_command('//g" | sed "s/')//g" | sed 's/\\\\/\\/g' >> .vimrc

sed -i "s/ = /=/g" .vimrc

# keys
echo '' >> .vimrc
echo '"keys' >> .vimrc
echo '' >> .vimrc
## nmap
cat lua/keys.lua | grep "'n'," | grep -v 'noremap' | sed "s/vim.api.nvim_set_keymap('n', '/nmap /g" >> .vimrc
cat lua/keys.lua | grep "'n'," | grep 'noremap = false' | sed "s/vim.api.nvim_set_keymap('n', '/nmap /g" >> .vimrc
## imap
cat lua/keys.lua | grep "'i'," | grep -v 'noremap' | sed "s/vim.api.nvim_set_keymap('i', '/imap /g" >> .vimrc
cat lua/keys.lua | grep "'i'," | grep 'noremap = false' | sed "s/vim.api.nvim_set_keymap('i', '/imap /g" >> .vimrc
## vmap
cat lua/keys.lua | grep "'v'," | grep -v 'noremap' | sed "s/vim.api.nvim_set_keymap('v', '/vmap /g" >> .vimrc
cat lua/keys.lua | grep "'v'," | grep 'noremap = false' | sed "s/vim.api.nvim_set_keymap('v', '/vmap /g" >> .vimrc
## nnoremap
cat lua/keys.lua | grep "'n'," | grep 'noremap = true' | sed "s/vim.api.nvim_set_keymap('n', '/nnoremap /g" >> .vimrc
## inoremap
cat lua/keys.lua | grep "'i'," | grep 'noremap = true' | sed "s/vim.api.nvim_set_keymap('i', '/inoremap /g" >> .vimrc
## vnoremap
cat lua/keys.lua | grep "'v'," | grep 'noremap = true' | sed "s/vim.api.nvim_set_keymap('v', '/vnoremap /g" >> .vimrc

sed -i "s/', '/ /g" .vimrc
sed -i "s/', {.*//g" .vimrc
sed -i "s/--.*//g" .vimrc
