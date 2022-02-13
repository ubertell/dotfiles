vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

vim.g.fzf_layout = { window = 'enew' }

vim.g.fzf_preview_window = {}

vim.g.fzf_colors = { 
  ['bg'] = {'bg', 'Normal'},
  ['bg+'] = {'bg', 'Visual'},
  ['fg'] = {'fg', 'Normal'},
  ['fg+'] = {'fg', 'Normal'},
  ['hl'] = {'fg', 'Green'},
  ['hl+'] = {'fg', 'Red'},
  ['gutter'] = {'bg', 'Normal'},
  ['info'] = {'bg', 'Normal'},
  ['spinner'] = {'bg', 'Normal'},
  ['pointer'] = {'fg', 'Red'},
  ['prompt'] = {'fg', 'Normal'},
  ['query'] = {'fg', 'Normal'},
  ['border'] = {'fg', 'Normal'},
  ['header'] = {'fg', 'Normal'},
} 
