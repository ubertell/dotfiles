require('helpers/clone_github_repo')
packages_dir = vim.fn.stdpath('data') .. '/site/pack/packer/start'
vim.cmd ('silent! !mkdir -p ' .. packages_dir)
clone_github_repo('wbthomason', 'packer.nvim', packages_dir .. '/packer.nvim')

require('packer').startup(function()

  use 'wbthomason/packer.nvim'

  use {
    'habamax/vim-sugarlily',
    'sainnhe/everforest'
  }

  use {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
    'junegunn/fzf.vim',
    'junegunn/gv.vim',
    'junegunn/vim-easy-align',
    'junegunn/vim-peekaboo',
    'mhinz/vim-sayonara',
    'neovim/nvim-lspconfig',
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
