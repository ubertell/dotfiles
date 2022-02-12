     
vim.g.nvim_tree_show_icons = { git = 0, folders = 0, files = 0, folder_arrows = 0 }

--     \ 'folders': 0,
--     \ 'files': 0,
--     \ 'folder_arrows': 0,
--     \ }
-- "If 0, do not show the icons for one of 'git' 'folder' and 'files' "1 by default, notice that if 'files' is 1, it will only display
-- "if nvim-web-devicons is installed and on your runtimepath.
-- "if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
-- "but this will not work when you set indent_markers (because of UI conflict)

-- " default will show icon by default if no icon is provided
-- " default shows no icon by default
-- let g:nvim_tree_icons = {
--     \ 'default': '',
--     \ 'symlink': '',
--     \ 'git': {
--     \   'unstaged': "✗",
--     \   'staged': "✓",
--     \   'unmerged': "",
--     \   'renamed': "➜",
--     \   'untracked': "★",
--     \   'deleted': "",
--     \   'ignored': "◌"
--     \   },
--     \ 'folder': {
--     \   'arrow_open': "",
--     \   'arrow_closed': "",
--     \   'default': "",
--     \   'open': "",
--     \   'empty': "",
--     \   'empty_open': "",
--     \   'symlink': "",
--     \   'symlink_open': "",
--     \   }
--     \ }

vim.cmd 'nnoremap <silent> <C-n> :NvimTreeToggle<CR>'
vim.cmd 'nnoremap <silent> <leader>r :NvimTreeRefresh<CR>'
vim.cmd 'nnoremap <silent> <leader>n :NvimTreeFindFile<CR>'

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = false,
    }
  }
}
