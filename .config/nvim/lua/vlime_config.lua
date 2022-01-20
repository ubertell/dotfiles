vim.g.vlime_compiler_policy = {["DEBUG"] = 3}

vim.g.vlime_cl_impl = "ros"

vim.cmd [[
function! VlimeBuildServerCommandFor_ros(vlime_loader, vlime_eval)
  return ["ros", "run", "--load", a:vlime_loader, "--eval", a:vlime_eval ]
endfunction
]]

vim.g.vlime_window_settings = {
  ['repl'] = {
    ['pos']      = 'botright',
    ['size']     = null,
    ['vertical'] = true
  },
  ['arglist'] = {
    ['pos']      = 'topleft',
    ['size']     = 1,
  },
  ['preview'] = {
    ['pos']      = 'topleft',
    ['size']     = 5,
  }
}
