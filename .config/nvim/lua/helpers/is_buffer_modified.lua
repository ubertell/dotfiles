function is_buffer_modified()
  return (1 == vim.api.nvim_eval('&modified'))
end
