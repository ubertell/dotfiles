require('helpers/git_root')
require('helpers/map_key')

vim.g.mapleader = " "
vim.g.maplocalleader = ","

map_key('i', 'jk', '<esc>')
map_key('n', '<leader>`', ':Sayonara!<cr>', {silent=true})
map_key('n', '<C-h>', '<C-w>h')  
map_key('n', '<C-j>', '<C-w>j')  
map_key('n', '<C-k>', '<C-w>k')  
map_key('n', '<C-l>', '<C-w>l')  
map_key('n', '<bs>', ':nohl<cr>')
map_key('n', 'k', 'gk', {silent=true})
map_key('n', 'j', 'gj', {silent=true})
-- map_key('n', '<F10>', ':TSHighlightCapturesUnderCursor<cr>')
map_key('n', '<leader>f', ':execute \'Files\' v:lua.git_root()<cr>', {silent=true})
map_key('n', '<leader>0', ':execute \'Files\' $HOME<cr>', {silent=true})
-- map_key('n', '<leader>1', ':execute \'Explore\' v:lua.git_root()<cr>', {silent=true})

template_dir = os.getenv('HOME') .. '/repo/templates'

vim.cmd ([[command! -nargs=1 ReadTemplate :silent .-1r]] .. template_dir .. [[/<args>]])

vim.cmd ([[nnoremap <silent> <localleader>t :call fzf#run({ 'source': 'find ]] .. 
         template_dir .. 
         [[ -type f -not -path "*/.git/*" -mindepth 2 -printf "%P\n"', 'sink': 'ReadTemplate'})<cr>]])

vim.cmd ([[nnoremap <F10> :echo "hi<" . ]] ..
         [[ synIDattr(synID(line("."),col("."),1),"name") . ]] ..
         [[ '> trans<' . ]] ..
         [[ synIDattr(synID(line("."),col("."),0),"name") . ]] ..
         [[ "> lo<" . ]] ..
         [[ synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ]] ..
         [[ ">" ]] ..
         [[ <CR>]])
