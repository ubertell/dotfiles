vim.o.background = 'dark'

vim.g.everforest_background = 'hard'
vim.g.everforest_disable_italic_comment = 1

c = vim.cmd 

c 'colorscheme everforest'

--| VIM

c 'hi EndOfBuffer  guifg=#2b3339'
c 'hi PMenuSel     guifg=#dbbc7f guibg=#525658'
c 'hi StatusLine   guibg=none'
c 'hi StatusLineNC gui=none      guibg=none guifg=#666666'
c 'hi TabLine      guifg=#859289 guibg=none'
c 'hi TabLineFill  guifg=#d3c6aa guibg=none'
c 'hi TabLineSel   guifg=#d3c6aa guibg=none'
c 'hi Visual       guibg=#46484a'

c 'hi! link Constant   CL_String'
c 'hi! link SignColumn Normal'

--| COLORSCHEME

c 'hi! BlueSign  guibg=none'
c 'hi! GreenSign guibg=none'
c 'hi! RedSign   guibg=none'

--| ELIXIR

-- c 'hi! elixirString          guifg=#c0997c'
-- c 'hi! elixirStringDelimiter guifg=#c0997c'
c 'hi! elixirModuleAttribute guifg=#bc9d7f'
-- c 'hi! exlixirAttribute guifg=#c0997c'
c 'hi! link elixirString Green'
c 'hi! link elixirStringDelimiter Green'
c 'hi! elixirQuote   guifg=#e67e80 gui=none'
c 'hi! elixirUnQuote guifg=#e67e80 gui=italic'

c 'hi! link elixirAlias              Green'
c 'hi! link elixirAmpersand          Purple'
c 'hi! link elixirArgumentsDelimiter Yellow'
c 'hi! link elixirBar                Blue'
c 'hi! link elixirColon              Aqua'
c 'hi! link elixirComment            Comment'
c 'hi! link elixirDocString          Comment'
c 'hi! link elixirDocStringDelimiter Comment'
c 'hi! link elixirDot                Purple'
c 'hi! link elixirFatRightArrow      Orange'
c 'hi! link elixirImport             Blue'
c 'hi! link elixirRequire            Purple'
c 'hi! link elixirKeyword            Normal'
c 'hi! link elixirLeftArrow          Red'
c 'hi! link elixirListDelimiter      Blue'
c 'hi! link elixirMapDelimiter       Orange'
c 'hi! link elixirNumber             Purple'
c 'hi! link elixirPseudoVariable     Normal'
c 'hi! link elixirRightArrow         Red'
c 'hi! link elixirSigil              Normal'
c 'hi! link elixirSigilDelimiter     Yellow'
c 'hi! link elixirTupleDelimiter     Red'
c 'hi! link elixirUnusedVariable     Comment'
c 'hi! link elixirUse                Yellow'

--| ERLANG

c 'hi! link Erl_Colon           Orange'
c 'hi! link Erl_Comma           Normal'
c 'hi! link Erl_CommaEnd        Normal'
c 'hi! link Erl_Comment         Comment'
c 'hi! link Erl_Equal           Normal'
c 'hi! link Erl_FatRightArrow   Normal'
c 'hi! link Erl_IgnoredVariable Comment'
c 'hi! link Erl_ListD           Blue'
c 'hi! link Erl_MapD            Green'
c 'hi! link Erl_ParenD          Yellow'
c 'hi! link Erl_Record          Yellow'
c 'hi! link Erl_SemiColon       Purple'
c 'hi! link Erl_Send            Normal'
c 'hi! link Erl_TupleD          Red'
c 'hi  Erl_Keyword              gui=underline'
c 'hi! Erl_String               guifg=#b99f7c' -- brown
c 'hi! link Erl_StringModifier  Orange'

--| COMMON LISP

c 'hi! CL_ParameterModifier gui=italic'
c 'hi! CL_String            guifg=#b99f7c'
c 'hi! link CL_Backquote      Red'
c 'hi! link CL_BackquoteParen Red'
c 'hi! link CL_Comma          Yellow'
c 'hi! link CL_Comma          Yellow'
c 'hi! link CL_CommaAt        Yellow'
c 'hi! link CL_CommaAtParen   Yellow'
c 'hi! link CL_CommaParen     Yellow'
c 'hi! link CL_Comment        Comment'
c 'hi! link CL_KeywordColon   Aqua'
c 'hi! link CL_PackageColon   Aqua'
c 'hi! link CL_Paren          Comment'
c 'hi! link CL_Quote          Blue'
c 'hi! link CL_QuoteParen     Blue'
c 'hi! link CL_ReaderMacro    Green'
c 'hi! link CL_StringQuote    CL_String'
c 'hi! link CL_VectorParen    Green'
c 'hi! link vlime_replString  CL_String'
