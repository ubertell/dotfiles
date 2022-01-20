vim.o.background = 'light'

vim.cmd 'colorscheme sugarlily'

c = vim.cmd 

-- Vim

c 'hi! EndOfBuffer guifg=#fefefe guibg=#fefefe'
c 'hi! IncSearch guifg=#000000 guibg=#f0f0c0'
c 'hi! Search guifg=#000000 guibg=#f0f0c0'
c 'hi! Visual guifg=#000000 guibg=#f0f0c0'
c 'hi! colorcolumn guifg=#000000 guibg=#f0f0f0'
c 'hi! statusline guifg=#000000 guibg=#f0f0f0'
c 'hi! statuslineNC guifg=#000000 guibg=#f0f0f0'

-- Elixir

c 'hi! link elixirComment Comment'
c 'hi! link elixirDocString Comment'
c 'hi! elixirQuote guifg=#990000'
c 'hi! elixirUnquote guifg=#990000 gui=italic'

-- Erlang

c 'hi! link erl_Comment Comment'
