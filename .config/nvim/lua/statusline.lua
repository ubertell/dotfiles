function _G.make_statusline(wnr)
    active = wnr == vim.fn.winnr()
    width  = vim.api.nvim_win_get_width(vim.fn.win_getid(wnr))
    bnr    = vim.fn.winbufnr(wnr)
    bname  = vim.fn.bufname(bnr)
    bname  = bname == "" and "NO NAME" or bname
    bname  = " " .. bname .. " "
    bft    = vim.api.nvim_buf_get_option(bnr, 'filetype')
    bft    = bft == "" and "NONE" or bft
    bft    = " " .. string.upper(bft) .. " "
    if active then
        filler = string.rep("—", width - #bname - #bft - 18)
        return  "——"    ..  -- 2
                bname   .. 
                "——"    ..  -- 2
                filler  .. 
                "——"    ..  -- 2
                " %4l " ..  -- 6
                "——"    ..  -- 2
                bft     .. 
                "————"      -- 4
    else
        return string.rep("—", width)
    end
end

function _G.refresh_statusline()
   for n = 1,vim.fn.winnr('$'),1 do
       vim.fn.setwinvar(n, '&statusline', _G.make_statusline(n)) 
   end
end

require('helpers/augroup')

augroup('statusline', {
    'VimEnter,WinEnter,BufWinEnter * call v:lua.refresh_statusline()'
})

vim.o.statusline="%{%v:lua.make_statusline()%}"
