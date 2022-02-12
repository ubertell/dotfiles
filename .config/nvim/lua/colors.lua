vim.o.background = 'dark'

vim.g.everforest_background = 'hard'
vim.g.everforest_disable_italic_comment = 1

c = vim.cmd 

c 'colorscheme everforest'

--| EXTRA COLORS

c 'hi! Brown guifg=#c09979'
c 'hi! BrownItalic guifg=#c39979 gui=italic'
c 'hi! BrownBold guifg=#c39979 gui=bold'
c 'hi! RedItalic guifg=#e67e80 gui=italic'
c 'hi! NormalItalic guifg=#d3c6aa guibg=#2b3339 gui=italic'
c 'hi! NormalBold guifg=#d3c6aa guibg=#2b3339 gui=bold'

c 'hi! Gray guifg=#a0a090'
c 'hi! BlueGray guifg=#a6b0b0'

c 'hi! MuteAqua guifg=#82ad96 guibg=#2b3339'
c 'hi! MutePurple guifg=#9d88a3 guibg=#2b3339'

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

c 'hi! elixirKeyword         guifg=none gui=underline'

c 'hi! link elixirBlockDefinition Normal'
c 'hi! link elixirColon           Brown'
c 'hi! link elixirTodo            Comment'
c 'hi! link elixirDefine          Normal' 
c 'hi! link elixirDot             Normal'
c 'hi! link elixirLangAlias       Normal'
c 'hi! link elixirLangImport      Normal'
c 'hi! link elixirLangRequire     Normal'
c 'hi! link elixirLangUse         Normal'
c 'hi! link elixirMacroDefine     Normal'
c 'hi! link elixirModuleDefine    Normal'
c 'hi! link elixirPriveDefine     Normal' 
c 'hi! link elixirVariable        Normal'
-- c 'hi! elixirVariable guifg=#aaaaa0'

c 'hi! elixirPrivateDefine   guifg=none'
c 'hi! elixirRecordDefine    guifg=none'
c 'hi! elixirStructDefine    guifg=none'

c 'hi! link elixirUnQuote    NormalItalic' 
c 'hi! link elixirQuote      NormalItalic'

c 'hi! link elixirQuote NormalItalic'

-- c 'hi! elixirDocString guifg=#8e9993'
c 'hi! link elixirDocString Comment'

c 'hi! link elixirString              Green' 
c 'hi! link elixirStringDelimiter     ElixirString'
c 'hi! link elixirInterpolationDelimiter Green'
c 'hi! link elixirInterpolation       Normal'

c 'hi! link elixirFunctionDeclaration Green'
c 'hi! link elixirPrivateFunctionDeclaration Green'

c 'hi! link elixirAnonymousFunction Normal'
c 'hi! link elixirThinRightArrow Normal'
c 'hi! link elixirThinLeftArrow Normal'

c 'hi! link elixirAlias               Yellow'
c 'hi! link elixirAmp                 Purple'
c 'hi! link elixirBar                 Blue'
c 'hi! link elixirBoolean             Aqua'
c 'hi! link elixirComment             Comment'
c 'hi! link elixirConcurrency         Purple'
c 'hi! link elixirDelegateDefine      Normal'
c 'hi! link elixirDocStringDelimiter  Comment'
c 'hi! link elixirDocTest             Gray'
c 'hi! link elixirEq                  Brown'
c 'hi! link elixirExUnitAssert        Normal'
c 'hi! link elixirExUnitMacro         Normal'
c 'hi! link elixirExceptionDefine     Normal'
c 'hi! link elixirFatRightArrow       Orange'
c 'hi! link elixirImplDefine          Normal'
c 'hi! link elixirListDelimiter       Blue'
c 'hi! link elixirMacroDeclaration    Red'
c 'hi! link elixirMapDelimiter        Orange'
c 'hi! link elixirModuleDeclaration   Yellow'
c 'hi! link elixirNumber              Normal'
c 'hi! link elixirOperator            Normal'
c 'hi! link elixirParens              Brown'
c 'hi! link elixirPipe                Normal'
c 'hi! link elixirProtocolDefine      Normal'
c 'hi! link elixirSigil               Normal'
c 'hi! link elixirStructDelimiter     Orange'
c 'hi! link elixirTupleDelimiter      Red'
c 'hi! link elixirUnusedVariable      Comment'

c 'hi! elixirPseudoVariable gui=italic'
-- c 'hi! elixirSigilDelimiter      guifg=#a0a0a0'
c 'hi! link elixirSigilDelimiter purple'

--| EELIXIR

c 'hi! link eelixirDelimiter htmlTag'
c 'hi! link surfaceDelimiter htmlTag'

--| HTML

c 'hi! htmlTag guifg=#aaaa9e'

c 'hi! link htmlArg htmlTag'
c 'hi! link htmlScriptTag htmlTag'
c 'hi! link htmlEndTag htmlTag'

c 'hi! link htmlTagName Brown'
c 'hi! link htmlSpecialTagName Brown'

c 'hi! link htmlH1 Normal' 
c 'hi! link htmlH2 Normal' 
c 'hi! link htmlH3 Normal' 
c 'hi! link htmlH4 Normal' 
c 'hi! link htmlH5 Normal' 
c 'hi! link htmlH6 Normal' 
c 'hi! link htmlLink Normal' 

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
