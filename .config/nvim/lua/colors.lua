vim.o.background = 'dark'

vim.g.everforest_background = 'hard'
vim.g.everforest_disable_italic_comment = 1

c = vim.cmd 

c 'colorscheme everforest'

--| EXTRA COLORS

c 'hi! Brown guifg=#ca9a80'
c 'hi! Silver guifg=#aaaa9e'
c 'hi! Silver2 guifg=#b0b0a0'

c 'hi! NormalItalic guifg=#d3c6aa gui=italic'

c 'hi! Invisible guifg=#2b3339 guibg=#2b3339'
c 'hi! Invisible2 guifg=#525658 guibg=#525658'
c 'hi! Invisible3 guifg=#424648 guibg=#424648'

--| FZF

c 'hi! link fzf1 Invisible3'
c 'hi! link fzf2 Invisible3'
c 'hi! link fzf3 Invisible3'

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

c 'hi! link elixirDefaultArgument Silver'
c 'hi! link elixirRegexEscapePunctuation Normal'

c 'hi! elixirKeyword         guifg=none gui=underline'

c 'hi! link elixirColon           Normal'
c 'hi! link elixirParens          Brown'

c 'hi! link elixirAtom            Normal'
c 'hi! link elixirAtomColon       Normal'

c 'hi! link elixirAtomKey         Normal'
c 'hi! link elixirAtomKeyColon    Normal'

c 'hi! link elixirBlockDefinition Normal'
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

c 'hi! elixirPrivateDefine   guifg=none'
c 'hi! elixirRecordDefine    guifg=none'
c 'hi! elixirStructDefine    guifg=none'

c 'hi! elixirUnQuote    gui=underline,italic' 
c 'hi! elixirQuote      gui=underline,italic'

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
c 'hi! link elixirBoolean             Purple'
c 'hi! link elixirComment             Comment'
c 'hi! link elixirConcurrency         Purple'
c 'hi! link elixirDelegateDefine      Normal'
c 'hi! link elixirDocStringDelimiter  Comment'
c 'hi! link elixirDocTest             Silver'
c 'hi! link elixirEq                  Normal'
c 'hi! link elixirExUnitAssert        Normal'
c 'hi! link elixirExUnitMacro         Normal'
c 'hi! link elixirExceptionDefine     Normal'
c 'hi! link elixirFatRightArrow       Orange'
c 'hi! link elixirImplDefine          Normal'
c 'hi! link elixirListDelimiter       Blue'
c 'hi! link elixirMacroDeclaration    Orange'
c 'hi! link elixirMapDelimiter        Orange'
c 'hi! link elixirModuleDeclaration   Yellow'
c 'hi! link elixirNumber              Aqua'
c 'hi! link elixirOperator            Normal'
c 'hi! link elixirPipe                Normal'
c 'hi! link elixirProtocolDefine      Normal'
c 'hi! link elixirSigil               Normal'
c 'hi! link elixirStructDelimiter     Orange'
c 'hi! link elixirTupleDelimiter      Red'
c 'hi! link elixirUnusedVariable      Comment'

c 'hi! link elixirPseudoVariable Aqua'
c 'hi! link elixirSigilDelimiter Yellow'

--| EELIXIR

c 'hi! link eelixirDelimiter silver'
c 'hi! link surfaceDelimiter silver'

--| HTML

c 'hi! link htmlArg Normal'
c 'hi! link htmlEndTag htmlTag'
c 'hi! link htmlH1 Normal' 
c 'hi! link htmlH2 Normal' 
c 'hi! link htmlH3 Normal' 
c 'hi! link htmlH4 Normal' 
c 'hi! link htmlH5 Normal' 
c 'hi! link htmlH6 Normal' 
c 'hi! link htmlLink Normal' 
c 'hi! link htmlScriptTag htmlTag'
c 'hi! link htmlSpecialTagName Orange'
c 'hi! link htmlTag Normal'
c 'hi! link htmlTagName Orange'

--| ERLANG

c 'hi  Erl_Keyword              gui=underline'
c 'hi! link Erl_Colon           Brown'
c 'hi! link Erl_Comma           Normal'
c 'hi! link Erl_CommaEnd        Normal'
c 'hi! link Erl_Comment         Comment'
c 'hi! link Erl_Equal           Normal'
c 'hi! link Erl_FatRightArrow   Orange'
c 'hi! link Erl_IgnoredVariable Comment'
c 'hi! link Erl_ListD           Blue'
c 'hi! link Erl_MapD            Orange'
c 'hi! link Erl_ParenD          Brown'
c 'hi! link Erl_Record          Yellow'
c 'hi! link Erl_SemiColon       Purple'
c 'hi! link Erl_Send            Normal'
c 'hi! link Erl_String          Green'
c 'hi! link Erl_StringModifier  Aqua'
c 'hi! link Erl_TupleD          Red'

--| COMMON LISP

c 'hi! CL_ParameterModifier   gui=italic'
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
c 'hi! link CL_String         Brown'
c 'hi! link CL_StringQuote    CL_String'
c 'hi! link CL_VectorParen    Green'
c 'hi! link vlime_replString  CL_String'
