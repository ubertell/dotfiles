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

c 'hi! elixirBlockDefinition guifg=none'
c 'hi! elixirColon           guifg=#c09979'
c 'hi! elixirDefine          guifg=none'
c 'hi! elixirDot             guifg=#c09979'
c 'hi! elixirKeyword         guifg=none gui=underline'
c 'hi! elixirLangAlias       gui=italic'
-- c 'hi! link elixirLangAlias  Purple'
c 'hi! elixirLangImport      gui=italic'
c 'hi! elixirLangRequire     gui=italic'
c 'hi! elixirLangUse         gui=italic'
c 'hi! elixirMacroDefine     guifg=none'
c 'hi! elixirModuleDefine    guifg=none'
c 'hi! elixirParens          guifg=#c09979'
c 'hi! elixirPrivateDefine   guifg=none'
c 'hi! elixirQuote           guifg=#d699b6 gui=none'
-- c 'hi! elixirQuote           guifg=#e67e80 gui=none'
c 'hi! elixirRecordDefine    guifg=none'
c 'hi! elixirSigilDelimiter  guifg=#b0b0a0'
c 'hi! elixirStructDefine    guifg=none'
c 'hi! elixirUnQuote         guifg=#d699b6 gui=italic'
-- c 'hi! elixirUnQuote         guifg=#e67e80 gui=italic'
c 'hi! elixirVariable        guifg=#c09979'

c 'hi! link elixirDocTest             Comment'
c 'hi! link elixirAlias               Normal'
c 'hi! link elixirBar                 Blue'
c 'hi! link elixirBoolean             Normal'
c 'hi! link elixirComment             Comment'
c 'hi! link elixirConcurrency         Purple'
c 'hi! link elixirDocString           Comment'
c 'hi! link elixirDocStringDelimiter  Comment'
c 'hi! link elixirEq                  Normal'
c 'hi! link elixirExUnitMacro         Normal'
c 'hi! link elixirExUnitAssert        Normal'
c 'hi! link elixirFatRightArrow       Orange'
c 'hi! link elixirFunctionDeclaration Green'
c 'hi! link elixirImplDefine          Normal'
c 'hi! link elixirInterpolation       Normal'
c 'hi! link elixirInterpolationDelimiter elixirString'
c 'hi! link elixirListDelimiter       Blue'
c 'hi! link elixirMacroDeclaration    Red'
c 'hi! link elixirMapDelimiter        Orange'
c 'hi! link elixirModuleDeclaration Yellow'
c 'hi! link elixirNumber              Yellow'
c 'hi! link elixirOperator            Normal'
c 'hi! link elixirPipe                Normal'
c 'hi! link elixirPrivateFunctionDeclaration Green'
c 'hi! link elixirProtocolDefine      Normal'
c 'hi! link elixirPseudoVariable      Normal'
c 'hi! link elixirSigil               Normal'

-- c 'hi! elixirString guifg=#d28992'
c 'hi! elixirString guifg=#d39194'

-- c 'hi! link elixirStringDelimiter     elixirString'
c 'hi! link elixirStringDelimiter     elixirParens'

c 'hi! link elixirStructDelimiter     Orange'
c 'hi! link elixirTupleDelimiter      Red'
c 'hi! link elixirUnusedVariable      Comment'
c 'hi! link elixirExceptionDefine     Normal'

--| HEEX

c 'hi! link heexDelimiter Blue'
-- c 'hi! link heexDelimiter elixirParens'
c 'hi! link surfaceDelimiter Blue'
-- c 'hi! heexTag gui=bold guifg=#7fbbb3'
c 'hi! heexTag gui=bold guifg=#c09979'
c 'hi! link heexString Green'

--| ERLANG

c 'hi  Erl_Keyword              gui=underline'
c 'hi! link Erl_Colon           ElixirColon'
c 'hi! link Erl_Comma           Normal'
c 'hi! link Erl_CommaEnd        Normal'
c 'hi! link Erl_Comment         Comment'
c 'hi! link Erl_Equal           Normal'
c 'hi! link Erl_FatRightArrow   Normal'
c 'hi! link Erl_IgnoredVariable Comment'
c 'hi! link Erl_ListD           Blue'
c 'hi! link Erl_MapD            Orange'
c 'hi! Erl_ParenD               guifg=#c09979'
c 'hi! link Erl_Record          Yellow'
c 'hi! link Erl_SemiColon       Purple'
c 'hi! link Erl_Send            Normal'
c 'hi! link Erl_String          Green'
c 'hi! link Erl_StringModifier  Aqua'
c 'hi! link Erl_TupleD          Red'

--| COMMON LISP

c 'hi! CL_ParameterModifier   gui=italic'
c 'hi! CL_String              guifg=#c09979'
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
