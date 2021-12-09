--# deps: (mkdir, ag, fzf, git, gcc, libstdc++, python 3)

--|
--| HELPERS
--|

api = vim.api
c   = vim.cmd
e   = vim.api.nvim_eval
env = vim.env
fn  = vim.fn
g   = vim.g
o   = vim.opt
fmt = string.format

function augroup(name, commands)
  c ('augroup ' .. name)
  c 'autocmd!'
  for _, cmd in ipairs(commands) do
    c(cmd)
  end
  c 'augroup END'
end

function get_project_root()
  root = fn.system('git rev-parse --show-toplevel 2> /dev/null')
  if root == '' then
    return fn.getcwd()
  end
  return string.gsub(root, '\n', '')
end

function github_clone (user, repo, target_dir)
  if fn.empty(fn.glob(target_dir)) > 0 then
    c(fmt('!git clone http://github.com/%s/%s %s', user, repo, target_dir))
  end
end

function _G.show(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

--|
--| DIRS
--|

dirs = {}

dirs['data']     = (fn.stdpath 'data')
dirs['packages'] = dirs['data'] .. '/site/pack/packer/start'
dirs['undo']     = dirs['data'] .. '/undo'

c ('silent! !mkdir -p ' .. dirs['undo'])
c ('silent! !mkdir -p ' .. dirs['packages'])

--|
--| OPTIONS
--|

o.shortmess="filnxtToOFI"

-- 24-bit colors.
o.termguicolors = true

-- save undo history to an undo file.
o.undodir = dirs["undo"]
o.undofile = true

-- show the sign column.
o.signcolumn = 'yes'

-- ignore case, unless upper-case.
o.ignorecase = true
o.smartcase = true

-- no mode indicator.
o.showmode = false

-- enable mouse.
o.mouse = 'a'

-- no swap-file
o.swapfile = false

-- update timeout in ms.
o.updatetime = 200

-- Do not echo cmds
o.showcmd = false

-- Set default indentation
o.shiftwidth = 4
o.tabstop = 4
o.expandtab = true

-- Command line height
o.cmdheight = 1

--|
--| PACKER
--|

github_clone('wbthomason', 'packer.nvim', dirs['packages'] .. '/packer.nvim')

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
    -- 'airblade/vim-gitgutter',
    'junegunn/fzf.vim',
    'junegunn/gv.vim',
    'junegunn/vim-easy-align',
    'junegunn/vim-peekaboo',
    'mhinz/vim-sayonara',
    'morhetz/gruvbox',
    'sainnhe/everforest',
    'tpope/vim-commentary',
    'tpope/vim-fugitive',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
    'vlime/vlime',
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end,
    tag = 'release'
  }
  use {
    'eraserhd/parinfer-rust', 
    run = 'cargo build --release'
  }
  use {
    'junegunn/fzf',
    run = ':call fzf#install()'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-treesitter/playground',
    run = ':TSInstall query',
    requires = {'nvim-treesitter/nvim-treesitter'}
  }
end)

require('gitsigns').setup()

--|
--| AUTOSAVE
--|

function _G.save()
  if 1 == e '&modified' then
    c 'execute "update"'
  end
end

augroup('autosave', {'autocmd CursorHold * silent! call v:lua.save()'})

--|
--| NETWR
--|

g.netrw_liststyle = 3
g.netrw_banner = 0

--|
--| VLIME
--|

g.vlime_compiler_policy = {["DEBUG"] = 3}

g.vlime_cl_impl = "ros"

c [[
function! VlimeBuildServerCommandFor_ros(vlime_loader, vlime_eval)
  return ["ros", "run", "--load", a:vlime_loader, "--eval", a:vlime_eval ]
endfunction
]]

g.vlime_window_settings = {
  ['repl'] = {
    ['pos']      = 'botright',
    ['size']     = null,
    ['vertical'] = true
  },
  ['arglist'] = {
    ['pos']      = 'topleft',
    ['size']     = 1,
  },
  ['preview'] = {
    ['pos']      = 'topleft',
    ['size']     = 5,
  }
}

--|
--| FZF
--|

vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

g.fzf_layout = { window = 'enew' }
g.fzf_preview_window = {}

--|
--| PEEKABOO
--|

g.peekaboo_window = 'enew'

--|
--| TREESITTER
--|

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'lua', 'c', 'typescript', 'javascript'
  },
  highlight = {
    enable = true,
    disable = {'commonlisp', 'erlang'},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  playground = {
    enable = false,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

--|
--| STATUS LINE
--|

function _G.make_statusline(wnr)
    active = wnr == fn.winnr()
    width  = api.nvim_win_get_width(fn.win_getid(wnr))
    bnr    = fn.winbufnr(wnr)
    bname  = fn.bufname(bnr)
    bname  = bname == "" and "NO NAME" or bname
    bname  = " " .. bname .. " "
    bft    = vim.api.nvim_buf_get_option(bnr, 'filetype')
    bft    = bft == "" and "NONE" or bft
    bft    = " " .. string.upper(bft) .. " "
    if active then
        filler = string.rep("—", width - #bname - #bft - 18)
        return  "——"    ..  -- 2
                bname   .. 
                "——"    ..  -- 2
                filler  .. 
                "——"    ..  -- 2
                " %4l " ..  -- 6
                "——"    ..  -- 2
                bft     .. 
                "————"      -- 4
    else
        return string.rep("—", width)
    end
end

function _G.refresh_statusline()
   for n = 1,vim.fn.winnr('$'),1 do
       vim.fn.setwinvar(n, '&statusline', _G.make_statusline(n)) 
   end
end

augroup('statusline', { 'autocmd VimEnter,WinEnter,BufWinEnter * call v:lua.refresh_statusline()' })

o.statusline="%{%v:lua.make_statusline()%}"

--|
--| Tabline
--| 

function _G.tabLine() 
    nums = { [0] = 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII' }
    current = fn.tabpagenr()
    s = "%="
    for n = 1,vim.fn.tabpagenr('$'),1 do 
        if n == current then 
            s = s .. '%#TabLineSel#'
        else
            s = s .. '%#TabLine#'
        end 
        s = s .. ' ' .. nums[(n - 1) % 7] .. ' '
    end
	s = s .. '%#TabLineFill#%T'
    return s
end

o.tabline="%!v:lua.tabLine()"

--|
--| FILETYPES
--|

augroup('c',          { 'autocmd filetype c          setlocal shiftwidth=2 tabstop=2 expandtab' })
augroup('css',        { 'autocmd filetype css        setlocal shiftwidth=2 tabstop=2 expandtab' })
augroup('html',       { 'autocmd filetype html       setlocal shiftwidth=2 tabstop=2 expandtab' })
augroup('lua',        { 'autocmd filetype lua        setlocal shiftwidth=2 tabstop=2 expandtab' })
augroup('yaml',       { 'autocmd filetype yaml       setlocal shiftwidth=2 tabstop=2 expandtab' })
augroup('typescript', { 'autocmd filetype typescript setlocal shiftwidth=2 tabstop=2 expandtab' })
augroup('javascript', { 'autocmd filetype javascript setlocal shiftwidth=2 tabstop=2 expandtab' })

augroup('asd',        { 'autocmd BufRead,BufNewFile *.asd       set filetype=lisp' })
augroup('coleslawrc', { 'autocmd BufRead,BufNewFile .coleslawrc set filetype=lisp' })

--|
--| KEYS
--|

c 'nnoremap <localleader>; ;'
c 'nnoremap ; <nop>'

g.mapleader = " "
g.maplocalleader = ";"

c 'inoremap jk <esc>'
c 'nnoremap <silent> <leader>` :Sayonara!<cr>'
c 'nnoremap <silent> <leader>m :make<cr>'
c 'nnoremap <C-h> <C-w>h'
c 'nnoremap <C-j> <C-w>j'
c 'nnoremap <C-k> <C-w>k'
c 'nnoremap <C-l> <C-w>l'
c 'nnoremap <bs> :nohl<cr>'
c 'nnoremap <silent> k      gk'
c 'nnoremap <silent> j      gj'
c 'nnoremap <silent> <up>   gk'
c 'nnoremap <silent> <Down> gj'
 
c 'nnoremap <F10> :TSHighlightCapturesUnderCursor<cr>'

c [[nnoremap <silent> <leader>f :execute 'Files' v:lua.get_project_root()<cr>]]
c [[nnoremap <silent> <leader>0 :execute 'Files' $HOME<cr>]]

c [[nnoremap <silent> <leader>1 :execute 'Explore' v:lua.get_project_root()<cr>]]

--|
--| COLORSCHEME
--|

o.background = 'dark'

g.everforest_background = 'hard'
g.everforest_disable_italic_comment = 1

c 'colorscheme everforest'

--|
--| COLORS
--|

-- VIM

c 'hi StatusLine   guibg=none'
c 'hi StatusLineNC gui=none guibg=none guifg=#666666'
c 'hi Visual       guibg=#46484a'
c 'hi EndOfBuffer  guifg=#2b3339'
c 'hi TabLine      guifg=#859289 guibg=none'
c 'hi TabLineFill  guifg=#d3c6aa guibg=none'
c 'hi TabLineSel   guifg=#d3c6aa guibg=none'
c 'hi PMenuSel     guifg=#dbbc7f guibg=#525658'
c 'hi! link SignColumn Normal'

c 'hi! BlueSign  guibg=none'
c 'hi! GreenSign guibg=none'
c 'hi! RedSign   guibg=none'

-- COMMON LISP

c 'hi! link CL_Backquote      Red'
c 'hi! link CL_BackquoteParen Red'
c 'hi! link CL_Comma          Yellow'
c 'hi! link CL_Comma          Yellow'
c 'hi! link CL_CommaAt        Yellow'
c 'hi! link CL_CommaAtParen   Yellow'
c 'hi! link CL_CommaParen     Yellow'
c 'hi! link CL_Comment        Comment'
c 'hi! link CL_KeywordColon   Aqua'
c 'hi! link CL_PackageColon   Aqua'
c 'hi! link CL_Paren          Comment'
c 'hi! link CL_Quote          Blue'
c 'hi! link CL_QuoteParen     Blue'
c 'hi! link CL_ReaderMacro    Green'
c 'hi! link CL_VectorParen    Green'

c 'hi CL_ParameterModifier gui=italic'

c 'hi! CL_String guifg=#b99f7c'

c 'hi! link CL_StringQuote   CL_String'
c 'hi! link Constant         CL_String'
c 'hi! link vlime_replString CL_String'

-- ERLANG

c 'hi! link Erl_Colon           Purple'
c 'hi! link Erl_Comma           Normal'
c 'hi! link Erl_CommaEnd        Normal'
c 'hi! link Erl_Comment         Comment'
c 'hi! link Erl_Dot             Red'
c 'hi! link Erl_IgnoredVariable Comment'
c 'hi! link Erl_Keyword         Red'
c 'hi! link Erl_ParenD          Comment'
c 'hi! link Erl_RightArrow      Green'
c 'hi! link Erl_SemiColon       Blue'
c 'hi! link Erl_Send            Red'
c 'hi! link Erl_String          Aqua'
c 'hi! link Erl_Type            Comment'

c 'hi! Erl_TupleD  guifg=#b99f7c'
c 'hi! Erl_ListD   guifg=#b99f7c'
c 'hi! Erl_MapD    guifg=#b99f7c'
c 'hi! Erl_Record  guifg=#b99f7c'
c 'hi! Erl_Hash    guifg=#b99f7c'

c 'hi! Erl_Attribute  gui=italic'
c 'hi! Erl_Define     gui=italic'
c 'hi! Erl_RecordDef  gui=italic'

