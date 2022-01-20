function clone_github_repo(user, repo, target_dir)
  if vim.fn.empty(vim.fn.glob(target_dir)) > 0 then
    vim.cmd(
      fmt('!git clone http://github.com/%s/%s %s', user, repo, target_dir)
    )
  end
end
