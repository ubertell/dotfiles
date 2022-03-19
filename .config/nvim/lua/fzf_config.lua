vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

vim.g.fzf_layout = { window = 'enew' }

vim.g.fzf_preview_window = {}

vim.g.fzf_colors = { 
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
