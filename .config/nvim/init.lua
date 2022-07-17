c = vim.cmd
f = vim.fn
g = vim.g
o = vim.opt

-------------
-- Options --
-------------

c 'syntax on'
c 'filetype plugin on'

o.backup        = false
o.cmdheight     = 1
o.clipboard     = 'unnamedplus'
o.completeopt   = 'menu,longest'
o.expandtab     = true
o.ignorecase    = true
o.mouse         = 'a'
o.shiftwidth    = 2
o.shortmess     = "filnxtToOFIc"
o.showcmd       = false
o.showmode      = false
o.signcolumn    = 'yes'
o.smartcase     = true
o.swapfile      = false
o.tabstop       = 2
o.termguicolors = true
o.undodir       = f.stdpath('data') .. '/undo'
o.undofile      = true
o.updatetime    = 100
o.writebackup   = false
o.colorcolumn   = "80"

------------
-- Colors --
------------

require('colors')

-----------
-- Utils --
-----------

function git_root()
  root = f.system('git rev-parse --show-toplevel 2> /dev/null')
  if root == '' then
    return f.getcwd()
  end
  return string.gsub(root, '\n', '')
end

function augroup(group, commands)
  c('augroup ' .. group)
  c 'autocmd!'
  for _, cmd in ipairs(commands) do
    c('autocmd ' .. cmd)
  end
  c 'augroup END'
end

----------
-- Keys --
----------

function key(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap = true, silent = true})
end

key('n', '<space>-', '80i-<esc>')

key('i', 'jk', '<esc>')
key('n', '<C-h>', '<C-w>h')
key('n', '<C-j>', '<C-w>j')
key('n', '<C-k>', '<C-w>k')
key('n', '<C-l>', '<C-w>l')
key('n', '<bs>', ':nohl<cr>')
key('n', 'j', 'gj')
key('n', 'k', 'gk')
key('n', '<space>0', ':execute \'Files\' $HOME<cr>')
key('n', '<space>o', ':!xdg-open %<cr>')
key('n', '<space>`', ':Sayonara!<cr>')
key('n', '<space>~', ':qall!<cr>')
key('n', '<space>f', ':execute \'Files\' v:lua.git_root()<cr>')
key('n', '<space>r', ':NvimTreeRefresh<CR>')
key('n', '<space><space>', ':NvimTreeFindFile<CR>')
key('n', '\\w', "<Cmd>ZkNew { title = '' }<CR>")
key('n', '\\f', "<Cmd>ZkNotes { sort = { 'modified' } }<CR>")
key('n', '\\t', "<Cmd>ZkTags<CR>")
key('n', '\\s', "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<CR>")
key('v', '\\g', ":'<,'>ZkMatch<CR>")
key('n', '\\i', "<Cmd>ZkIndex<CR>")

c [[imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '']]

key('n', '<F10>',
  [[:echo "hi<" . ]] ..
  [[ synIDattr(synID(line("."),col("."),1),"name") . ]] ..
  [[ '> trans<' . ]] ..
  [[ synIDattr(synID(line("."),col("."),0),"name") . ]] ..
  [[ "> lo<" . ]] ..
  [[ synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ]] ..
  [[ ">" ]] ..
  [[ <CR>]])

---------------
-- Auto save --
---------------

function _G.autosave()
  if 1 == vim.api.nvim_eval('&modified') then
    c 'silent! ALEFix'
    c 'update'
    c 'ALELint'
  end
end

-- augroup('alefix', {'User ALEFixPost update'})

augroup('autosave', {'CursorHold * silent! call v:lua.autosave()'})

----------------
-- Statusline --
----------------

function _G.make_statusline(wnr)
  active = wnr == f.winnr()
  width  = vim.api.nvim_win_get_width(f.win_getid(wnr))
  bnr    = f.winbufnr(wnr)
  bname  = f.bufname(bnr)
  if bname == "NvimTree_1" then
    return string.rep("—", width)
  end
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
  for n = 1,f.winnr('$'),1 do
    f.setwinvar(n, '&statusline', _G.make_statusline(n))
  end
end

augroup('statusline', {
  'VimEnter,WinEnter,BufWinEnter * call v:lua.refresh_statusline()'
})

o.statusline="%{%v:lua.make_statusline()%}"

-------------
-- Tabline --
-------------

function _G.make_tabline()
  nums = { [0] = 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII' }
  current = f.tabpagenr()
  s = "%="
  for n = 1,f.tabpagenr('$'),1 do
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

o.tabline="%!v:lua.make_tabline()"

---------------
-- Filetypes --
---------------

augroup('elixir', {
  'filetype elixir setlocal shiftwidth=2 tabstop=2 expandtab commentstring=#\\ %s',
  'BufRead,BufNewFile *.heex set filetype=eelixir',
  'filetype eelixir setlocal shiftwidth=2 tabstop=2 expandtab'
})

augroup('erlang', {
  'filetype erlang setlocal shiftwidth=4 tabstop=4 expandtab',
  'BufRead,BufNewFile *.{app,app.src,rel,config} set filetype=erlang'
})

augroup('ada', {
  'filetype ada setlocal shiftwidth=3 tabstop=3 expandtab'
})

------------
-- Packer --
------------

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
      'dense-analysis/ale',
      'ggandor/lightspeed.nvim',
      'junegunn/fzf',
      'junegunn/fzf.vim',
      'kyazdani42/nvim-tree.lua',
      'mhinz/vim-sayonara',
      'tpope/vim-commentary',
      'L3MON4D3/LuaSnip',
      'mickael-menu/zk-nvim',
      -- 'lifepillar/vim-mucomplete'
  }
  use {
    'neovim/nvim-lspconfig'
  }
end)

---------
-- ALE --
---------

g.ale_sign_error = '›'
g.ale_sign_warning = '›'

g.ale_ada_gcc_options = '-gnatwa -gnatq -gnat2022'

g.ale_lint_on_text_changed = 0
g.ale_lint_on_insert_leave = 0
g.ale_lint_on_enter = 0
g.ale_lint_on_save = 0
g.ale_lint_on_filetype_changed = 0

g.ale_fixers = {
  ada = {
    'gnatpp'
  },
  elixir = {
    'mix_format'
  },
  markdown = {}
}

g.ale_linters_explicit = 1
g.ale_linters = {
  markdown = {},
  ada = {'adals', 'gcc'},
  elixir = {'credo'},
  typescript = {'deno'},
  javascript = {'deno'}
}

-- g.ale_disable_lsp = 1

---------
-- FZF --
---------

vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
g.fzf_layout = { window = 'enew' }
g.fzf_preview_window = {}

g.fzf_colors = {
  ['bg'] = {'bg', 'Normal'},
  ['bg+'] = {'bg', 'Visual'},
  ['border'] = {'fg', 'Normal'},
  ['fg'] = {'fg', 'Normal'},
  ['fg+'] = {'fg', 'Normal'},
  ['gutter'] = {'bg', 'Normal'},
  ['header'] = {'fg', 'Normal'},
  ['hl'] = {'fg', 'Green'},
  ['hl+'] = {'fg', 'Red'},
  ['info'] = {'bg', 'Normal'},
  ['pointer'] = {'fg', 'Red'},
  ['prompt'] = {'fg', 'Normal'},
  ['query'] = {'fg', 'Normal'},
  ['spinner'] = {'bg', 'Normal'},
}

--------
-- Zk --
--------

require("zk").setup({
  -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
  -- it's recommended to use "telescope" or "fzf"
  picker = "fzf",

  lsp = {
    -- `config` is passed to `vim.lsp.start_client(config)`
    config = {
      cmd = { "zk", "lsp" },
      name = "zk",
      on_attach = (function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      end)
    },

    -- automatically attach buffers in a zk notebook that match the given filetypes
    auto_attach = {
      enabled = true,
      filetypes = { "markdown" },
    },
  },
})

------------
-- LSP --
------------

vim.diagnostic.config({
  virtual_text = true
})

vim.fn.sign_define("DiagnosticSignError",
                   {texthl = "DiagnosticSignError", text = "›", numhl = "DiagnosticsSignError"})

-- vim.diagnostic.hide()

----------------
-- Lightspeed --
----------------

require'lightspeed'.setup {
    jump_to_unique_chars = false,
    ignore_case = true
}

c 'hi! LightspeedGreyWash guifg=none guibg=none'
c 'hi! link LightspeedLabel Red'
c 'hi! link LightspeedShortcut Red'
c 'hi! link LightspeedUniqueChar Normal'
c 'hi! link LightspeedUnlabeledMatch Red'

---------------
-- Nvim Tree --
---------------

-- g.nvim_tree_show_icons = { git = 0, folders = 0, files = 0, folder_arrows = 0 }
-- g.nvim_tree_add_trailing = 1

require("nvim-tree").setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  view = {
    width = '200',
    height = 30,
    hide_root_folder = false,
    side = 'right',
    -- auto_resize = true,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  renderer = {
    add_trailing = true,
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
      }
    }
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
}
-------------
-- LUASnip --
-------------

local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local function copy(args)
	return args[1]
end

ls.add_snippets('ada', {
  s('with', {
    t('with '), i(1), t(';'), i(0)
  }),
  s('use', {
    t('use '), i(1), t(';'), i(0)
  }),
  s('wu', {
    t('with '), i(1), t('; use '), rep(1), t(';'), i(0)
  }),
  s('pas', {
    t('package '), i(1), t(' is'),
    t({'', '   '}), i(2),
    t({'', 'private'}),
    t({'', '   '}), i(3),
    t({'', 'end '}), rep(1), t(';')
  }),
  s('pai', {
    t('package body '), i(1), t(' is'),
    t({'', '   '}), i(0),
    t({'', 'end '}), rep(1), t(';')
  }),
  s('pri', {
    t('procedure '), i(1), t(' ('), i(2), t({') is', '   '}),
    i(3),
    t({'', 'begin', '   '}),
    i(4),
    t({'', 'end '}), rep(1), t(';')
  }),
  s('prs', {
    t('procedure '), i(1), t(' ('), i(2), t(') '), i(3), t(';')
  }),
  s('fui', {
    t('function '), i(1), t(' ('), i(2), t(')'), t(' return '), i(3), t(' is'),
    t({'', '   '}), i(4),
    t({'', 'begin', '   '}),
    i(5),
    t({'', 'end '}), rep(1), t(';')
  }),
  s('fus', {
    t('function '), i(1), t(' ('), i(2), t(')'), t(' return '), i(3), t(';'),
  }),
  s('type', {
    t('type '), i(1), t(' is '), i(2), t(';'), i(0)
  }),
  s('record', {
    t({'record', '   '}), i(0), t({'', 'end record'})
  }),
  s('var', {
    i(1), t(' : '), i(2), t(';'), i(0)
  }),
  s('vara', {
    i(1), t(' : '), i(2), t(' := '), i(0), t(';')
  }),
  s('if', {
    t('if '), i(1), t(' then'), t({'', '   '}), i(0), t({'', 'end if;'})
  }),
  s('loop', {
    t({'loop', '   '}), i(0), t({'', 'end loop;'})
  }),
  s('for', {
    t('for '), i(1), t(' in '), i(2), t(' loop'),
    t({'', '   '}), i(0),
    t({'', 'end loop;'})
  }),
  s('while', {
    t('while '), i(1), t(' loop'),
    t({'', '   '}), i(0),
    t({'', 'end loop;'})
  })
})
