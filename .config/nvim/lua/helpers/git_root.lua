function git_root()
  root = vim.fn.system('git rev-parse --show-toplevel 2> /dev/null')
  if root == '' then
    return vim.fn.getcwd()
  end
  return string.gsub(root, '\n', '')
end
