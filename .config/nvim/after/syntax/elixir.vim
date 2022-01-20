syn clear
syn case match

syn keyword elixirAlias   alias
syn keyword elixirImport  import
syn keyword elixirQuote   quote
syn keyword elixirRequire require
syn keyword elixirUnQuote unquote unquote_splicing
syn keyword elixirUse     use

syn match elixirKeyword '\(\.\)\@<!\<\(for\|case\|when\|with\|cond\|if\|unless\|try\|receive\|after\|raise\|rescue\|catch\|else\|quote\|unquote\|super\|unquote_splicing\)\>:\@!'

syn keyword elixirInclude import require alias use


syn keyword elixirPseudoVariable __FILE__ __DIR__ __MODULE__ __ENV__ 
syn keyword elixirPseudoVariable __CALLER__ __STACKTRACE__

syn match elixirComment '#.*'

syn match elixirAmpersand     "&"
syn match elixirBar           "\s|\s"
syn match elixirColon         ":"
syn match elixirDot           '\.'
syn match elixirEqual         "="
syn match elixirFatRightArrow "=>"
syn match elixirProcent       "%"

syn match elixirUnusedVariable  '\%(\.\)\@<!\<_\w*\>\%((\)\@!'
syn match elixirModuleAttribute '@[a-zA-Z][a-zA-Z_]*'

syn region elixirArguments  matchgroup=elixirArgumentsDelimiter  start='(' end=')' contains=ALL
syn region elixirTuple matchgroup=elixirTupleDelimiter start="{"  end="}"  contains=ALL
syn region elixirList  matchgroup=elixirListDelimiter  start='\[' end='\]' contains=ALL
syn region elixirMap   matchgroup=elixirMapDelimiter   start="%{" end="}"  contains=ALL

syn match elixirDelimEscape "\\[(<{\[)>}\]/\"'|]" transparent display contained contains=NONE

syn cluster elixirStringContained contains=elixirInterpolation,elixirRegexEscape,elixirRegexCharClass
syn region  elixirString          matchgroup=elixirStringDelimiter        start=+\z("\)+   end=+\z1+     skip=+\\\\\|\\\z1+ contains=@elixirStringContained
syn region  elixirString          matchgroup=elixirStringDelimiter        start=+\z('''\)+ end=+^\s*\z1+ contains=@elixirStringContained
syn region  elixirString          matchgroup=elixirStringDelimiter        start=+\z("""\)+ end=+^\s*\z1+ contains=@elixirStringContained
syn region  elixirInterpolation   matchgroup=elixirInterpolationDelimiter start="#{"       end="}"       contained          contains=ALLBUT,elixirComment,@elixirNotTop
syn match   elixirString          "\(\w\)\@<!?\%(\\\(x\d{1,2}\|\h{1,2}\h\@!\>\|0[0-7]{0,2}[0-7]\@!\>\|[^x0MC]\)\|(\\[MC]-)+\w\|[^\s\\]\)"

syn match elixirNumber '\<-\?\d\(_\?\d\)*\(\.[^[:space:][:digit:]]\@!\(_\?\d\)*\)\?\([eE][-+]\?\d\(_\?\d\)*\)\?\>'
syn match elixirNumber '\<-\?0[xX][0-9A-Fa-f]\+\>'
syn match elixirNumber '\<-\?0[oO][0-7]\+\>'
syn match elixirNumber '\<-\?0[bB][01]\+\>'

syn region elixirSigil matchgroup=elixirSigilDelimiter start="\~\u\z(/\|\"\|'\||\)" end="\z1" skip="\\\\\|\\\z1" contains=elixirDelimEscape fold
syn region elixirSigil matchgroup=elixirSigilDelimiter start="\~\u{"                end="}"   skip="\\\\\|\\}"   contains=elixirDelimEscape fold
syn region elixirSigil matchgroup=elixirSigilDelimiter start="\~\u<"                end=">"   skip="\\\\\|\\>"   contains=elixirDelimEscape fold
syn region elixirSigil matchgroup=elixirSigilDelimiter start="\~\u\["               end="\]"  skip="\\\\\|\\\]"  contains=elixirDelimEscape fold
syn region elixirSigil matchgroup=elixirSigilDelimiter start="\~\u("                end=")"   skip="\\\\\|\\)"   contains=elixirDelimEscape fold
syn region elixirSigil matchgroup=elixirSigilDelimiter start="\~\l\z(/\|\"\|'\||\)" end="\z1" skip="\\\\\|\\\z1"                                                              fold
syn region elixirSigil matchgroup=elixirSigilDelimiter start="\~\l{"                end="}"   skip="\\\\\|\\}"   contains=@elixirStringContained,elixirRegexEscapePunctuation fold
syn region elixirSigil matchgroup=elixirSigilDelimiter start="\~\l<"                end=">"   skip="\\\\\|\\>"   contains=@elixirStringContained,elixirRegexEscapePunctuation fold
syn region elixirSigil matchgroup=elixirSigilDelimiter start="\~\l\["               end="\]"  skip="\\\\\|\\\]"  contains=@elixirStringContained,elixirRegexEscapePunctuation fold
syn region elixirSigil matchgroup=elixirSigilDelimiter start="\~\l("                end=")"   skip="\\\\\|\\)"   contains=@elixirStringContained,elixirRegexEscapePunctuation fold
syn region elixirSigil matchgroup=elixirSigilDelimiter start="\~\l\/"               end="\/"  skip="\\\\\|\\\/"  contains=@elixirStringContained,elixirRegexEscapePunctuation fold

syn region elixirDocString matchgroup=elixirDocSigilDelimiter  start="\%(@\w*doc\(\s\|(\)\+\)\@<=\~[Ss]\z(/\|\"\|'\||\)" end="\z1" skip="\\\\\|\\\z1" contains=@elixirDocStringContained fold keepend
syn region elixirDocString matchgroup=elixirDocSigilDelimiter  start="\%(@\w*doc\(\s\|(\)\+\)\@<=\~[Ss]{"                end="}"   skip="\\\\\|\\}"   contains=@elixirDocStringContained fold keepend
syn region elixirDocString matchgroup=elixirDocSigilDelimiter  start="\%(@\w*doc\(\s\|(\)\+\)\@<=\~[Ss]<"                end=">"   skip="\\\\\|\\>"   contains=@elixirDocStringContained fold keepend
syn region elixirDocString matchgroup=elixirDocSigilDelimiter  start="\%(@\w*doc\(\s\|(\)\+\)\@<=\~[Ss]\["               end="\]"  skip="\\\\\|\\\]"  contains=@elixirDocStringContained fold keepend
syn region elixirDocString matchgroup=elixirDocSigilDelimiter  start="\%(@\w*doc\(\s\|(\)\+\)\@<=\~[Ss]("                end=")"   skip="\\\\\|\\)"   contains=@elixirDocStringContained fold keepend
syn region elixirDocString matchgroup=elixirDocStringDelimiter start=+\%(@\w*doc\(\s\|(\)\+\)\@<=\z("\)+                 end=+\z1+ skip=+\\\\\|\\\z1+ contains=@elixirDocStringContained      keepend
syn region elixirDocString matchgroup=elixirDocStringDelimiter start=+\%(@\w*doc\(\s\|(\)\+\)\@<=\z("""\)+               end=+^\s*\z1+                contains=@elixirDocStringContained fold keepend
syn region elixirDocString matchgroup=elixirDocSigilDelimiter  start=+\%(@\w*doc\(\s\|(\)\+\)\@<=\~[Ss]\z('''\)+         end=+^\s*\z1+                contains=@elixirDocStringContained fold keepend
syn region elixirDocString matchgroup=elixirDocSigilDelimiter  start=+\%(@\w*doc\(\s\|(\)\+\)\@<=\~[Ss]\z("""\)+         end=+^\s*\z1+                contains=@elixirDocStringContained fold keepend

syn sync minlines=2000
