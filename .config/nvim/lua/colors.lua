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

c 'hi! link SignColumn Normal'

--| COLORSCHEME

c 'hi! BlueSign  guibg=none'
c 'hi! GreenSign guibg=none'
c 'hi! RedSign   guibg=none'

--| ELIXIR

c 'hi! elixirQuote   guifg=#e67e80 gui=none'
c 'hi! elixirUnQuote guifg=#e67e80 gui=italic'

c 'hi! elixirColon              guifg=#a0a090'

c 'hi! elixirModuleAttribute    guifg=#c09979'
c 'hi! elixirParens             guifg=#c09979'
c 'hi! elixirDot                guifg=#c09979'
c 'hi! elixirBlockDefinition    guifg=#c09979'

c 'hi! link elixirAlias              Green'
c 'hi! link elixirAmpersand          Purple'
c 'hi! link elixirBar                Blue'
c 'hi! link elixirComment            Comment'
c 'hi! link elixirDocString          ElixirColon'
c 'hi! link elixirDocStringDelimiter ElixirColon'
c 'hi! link elixirFatRightArrow      Orange'
c 'hi! link elixirImport             Orange'
c 'hi! link elixirInterpolation      Normal'
c 'hi! link elixirInterpolationDelimiter Green'
c 'hi! link elixirKeyword            Normal'
c 'hi! link elixirLeftArrow          Normal'
c 'hi! link elixirLeftArrow          Red'
c 'hi! link elixirListDelimiter      Blue'
c 'hi! link elixirMapDelimiter       Orange'
c 'hi! link elixirNumber             Yellow'
c 'hi! link elixirPipe               Normal'
c 'hi! link elixirPseudoVariable     Normal'
c 'hi! link elixirRequire            Purple'
c 'hi! link elixirRightArrow         Normal'
c 'hi! link elixirSigil              Normal'
c 'hi! link elixirSigilDelimiter     Yellow'
c 'hi! link elixirString             Green'
c 'hi! link elixirStringDelimiter    Green'
c 'hi! link elixirStructDelimiter    Orange'
c 'hi! link elixirTupleDelimiter     Blue'
c 'hi! link elixirUnusedVariable     Comment'
c 'hi! link elixirUse                Yellow'

--| ERLANG

c 'hi! link Erl_Colon           ElixirColon'
c 'hi! link Erl_Comma           Normal'
c 'hi! link Erl_CommaEnd        Normal'
c 'hi! link Erl_Comment         Comment'
c 'hi! link Erl_Equal           Normal'
c 'hi! link Erl_FatRightArrow   Normal'
c 'hi! link Erl_IgnoredVariable Comment'
c 'hi! link Erl_ListD           Blue'
c 'hi! link Erl_MapD            Orange'
c 'hi! link Erl_ParenD          elixirArgumentsDelimiter'
c 'hi! link Erl_Record          Yellow'
c 'hi! link Erl_SemiColon       Purple'
c 'hi! link Erl_Send            Normal'
c 'hi! link Erl_TupleD          Red'
c 'hi  Erl_Keyword              gui=underline'
c 'hi! link Erl_String          Green'
c 'hi! link Erl_StringModifier  Aqua'

--| COMMON LISP

c 'hi! CL_ParameterModifier   gui=italic'
c 'hi! CL_String              guifg=#b99f7c'
-- brown = #c09979
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
