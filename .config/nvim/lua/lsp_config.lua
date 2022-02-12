--|
--| LANGUAGE SERVER 
--|

vim.diagnostic.disable()

local lspconfig = require("lspconfig")

-- Neovim doesn't support snippets out of the box, so we need to mutate the
-- capabilities we send to the language server to let them know we want snippets.

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup our autocompletion. These configuration options are the default ones
-- copied out of the documentation.
local completion = require("cmp")

completion.setup({
  -- snippet = {
  --   expand = function(args)
  --     -- For `vsnip` user.
  --     vim.fn["vsnip#anonymous"](args.body)
  --   end,
  -- },
  mapping = {
    ["<C-b>"] = completion.mapping.scroll_docs(-4),
    ["<C-f>"] = completion.mapping.scroll_docs(4),
    ["<C-Space>"] = completion.mapping.complete(),
    ["<C-e>"] = completion.mapping.close(),
    ["<C-y>"] = completion.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "vsnip" },
  },
  formatting = {
    format = function(entry, item)
      return { 
        ["word"] = item.word,
        ["abbr"] = item.abbr
      }
    end,
  },
})

local on_attach = function(_, bufnr)

  local function map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local map_opts = {noremap = true, silent = true}

  map("n", "df", "<cmd>lua vim.lsp.buf.formatting()<cr>", map_opts)
  map("n", "dt", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
  map("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
  map("n", "K",  "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)

  -- -- These have a different style than above because I was fiddling
  -- -- around and never converted them. Instead of converting them
  -- -- now, I'm leaving them as they are for this article because this is
  -- -- what I actually use, and hey, it works ¯\_(ツ)_/¯.
  -- vim.cmd [[imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
  -- vim.cmd [[smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]

  -- vim.cmd [[imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
  -- vim.cmd [[smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
  -- vim.cmd [[imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]
  -- vim.cmd [[smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]

  -- vim.cmd [[inoremap <silent><expr> <C-Space> compe#complete()]]
  -- vim.cmd [[inoremap <silent><expr> <CR> compe#confirm('<CR>')]]
  -- vim.cmd [[inoremap <silent><expr> <C-e> compe#close('<C-e>')]]
  -- vim.cmd [[inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })]]
  -- vim.cmd [[inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })]]

  -- -- tell nvim-cmp about our desired capabilities
  -- require("cmp_nvim_lsp").update_capabilities(capabilities)
end

-- ELXIR LS

local path_to_elixirls = os.getenv('HOME') .. '/opt/elixir-ls/language_server.sh'

lspconfig.elixirls.setup({
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = false,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false
    }
  }
})
