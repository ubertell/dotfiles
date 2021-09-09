-- deps: mkdir, git, gcc, libstdc++, python 3, fzf, ag

-- TODO: file nav, git + file-git-menu, lsp

-- Check, luna, nv

--|
--| HELPERS
--|

c   = vim.cmd
e   = vim.api.nvim_eval
g   = vim.g
fn  = vim.fn
o   = vim.opt
env = vim.env

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

-- 24-bit colors.
o.termguicolors=true

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
o.updatetime = 300

-- Do not echo cmds
o.showcmd = false

--|
--| PACKER
--|

function github_clone (user, repo, target_dir)
    if fn.empty(fn.glob(target_dir)) > 0 then
        c(fmt('!git clone http://github.com/%s/%s %s', user, repo, target_dir))
    end
end

github_clone('wbthomason', 'packer.nvim', dirs['packages'] .. '/packer.nvim')

require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'nvim-treesitter/playground',
        run = ':TSInstall query',
        requires = {'nvim-treesitter/nvim-treesitter'}
    }

    use {
        'tjdevries/express_line.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }

    use 'sainnhe/everforest'

    use {
        'lambdalisue/fern.vim',
        requires = {'antoinemadec/FixCursorHold.nvim'}
    }

    use {
        'lambdalisue/fern-hijack.vim',
        requires = { 'lambdalisue/fern.vim' },
    }

    use {
        'LumaKernel/fern-mapping-fzf.vim'
    }

    use {
        'airblade/vim-gitgutter'
    }

    use {
        'justinmk/vim-sneak'
    }

    use {
        'junegunn/fzf', 
        run = 'fzf#install()'
    }

    use {
        'junegunn/fzf.vim'
    }

    
end)

--|
--| Fzf
--|

vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
g.fzf_layout = { window = 'enew' }
g.fzf_preview_window = {}

--|
--| Fern
--|

g['fern#default_hidden'] = 1
g['fern#default_exclude'] = '.git'

--|
--| Sneak
--|

g['sneak#label'] = 1
g['sneak#s_next'] = 0

--|
--| TREESITTER
--|

require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'julia' },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
    playground = {
        enable = true,
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
--| EXPRESS STATUS LINE
--|

require('el').setup {
    generator = function(win_id)
        local extensions = require('el.extensions')
        local sections = require('el.sections')
        local builtin = require('el.builtin')
        local subscribe = require('el.subscribe')
        local lsp_statusline = require('el.plugins.lsp_status')
        return {
            extensions.mode,
            sections.split,
            builtin.file,
            sections.collapse_builtin {
                ' ',
                builtin.modified_flag
            },
            sections.split,
            lsp_statusline.segment,
            lsp_statusline.current_function,
            -- helper.async_buf_setter(
            --   win_id,
            --   'el_git_stat',
            --   extensions.git_changes,
            --   5000
            -- ),
            -- '[', builtin.line, ' : ',  builtin.column, ']',
            sections.collapse_builtin{
                '[',
                builtin.help_list,
                builtin.readonly_list,
                ']',
            },
            builtin.filetype,
        }
    end
}

--|
--| FILETYPES
--|

augroup('lua', { 'autocmd filetype lua setlocal shiftwidth=4 tabstop=4 expandtab' })

--|
--| AUTO-SAVE
--|

function _G.save()
    if 1 == e '&modified' then
        vim.lsp.buf.formatting_sync()
        c 'execute "update"'
    end
end

augroup('autosave', {'autocmd CursorHold * silent! call v:lua.save()'})

--|
--| KEYS
--|

g.mapleader = " "

c 'inoremap jk <esc>'

c 'nnoremap <C-h> <C-w>h'
c 'nnoremap <C-j> <C-w>j'
c 'nnoremap <C-k> <C-w>k'
c 'nnoremap <C-l> <C-w>l'

c 'nnoremap <bs> :nohl<cr>'

-- wrap 
c 'noremap  <silent> <up>   gk'
c 'noremap  <silent> <Down> gj'

-- Tree sitter playground
c 'nnoremap <F10> :TSHighlightCapturesUnderCursor<cr>'

-- File navigation 

c [[nnoremap <silent> \ :execute 'Fern'  v:lua.get_project_root()<cr>]]
c [[nnoremap <silent> ; :execute 'Files' v:lua.get_project_root()<cr>]]
c [[nnoremap <silent> <leader>0 :execute 'Files' $HOME<cr>]]

--|
--| COLORSCHEME
--|

g.everforest_background = 'hard'
g.everforest_disable_italic_comment = 1

o.background = 'dark'

c 'colorscheme everforest'

--|
--| CUSTOM COLORS
--|

function hi_none(gs)
    for _, g in ipairs(gs) do
        c (fmt ('highlight %s guifg=none guibg=none', g))
    end
end

hi_none {
    'SignColumn'
}
