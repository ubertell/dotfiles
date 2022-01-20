function _G.make_tabline() 
    nums = { [0] = 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII' }
    current = vim.fn.tabpagenr()
    s = "%="
    for n = 1,vim.fn.tabpagenr('$'),1 do 
        if n == current then 
            s = s .. '%#TabLineSel#'
        else
            s = s .. '%#TabLine#'
        end 
        s = s .. ' ' .. nums[(n - 1) % 7] .. ' '
    end
	s = s .. '%#TabLineFill#%T'
    return s
end

o.tabline="%!v:lua.make_tabline()"
