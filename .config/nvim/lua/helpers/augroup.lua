function augroup(group, commands)
  vim.cmd ('augroup ' .. group)
  vim.cmd 'autocmd!'
  for _, cmd in ipairs(commands) do
    vim.cmd('autocmd ' .. cmd)
  end
  vim.cmd 'augroup END'
end
