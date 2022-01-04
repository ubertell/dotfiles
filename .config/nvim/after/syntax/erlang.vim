syn clear
syn case match

syn keyword Erl_Keyword after begin case catch cond end fun if let of
syn keyword Erl_Keyword receive when try

syn match Erl_Colon         ":"
syn match Erl_Comment       '%.*$'
syn match Erl_FatRightArrow "=>"
syn match Erl_SemiColon     ";"
syn match Erl_Send          "!"
syn match Erl_ThinRightArrow "->"

" syn match Erl_QuotedAtomModifier '\\\%(\o\{1,3}\|x\x\x\|x{\x\+}\|\^.\|.\)' contained
" syn match Erl_Modifier           '\$\%([^\\]\|\\\%(\o\{1,3}\|x\x\x\|x{\x\+}\|\^.\|.\)\)'
"
syn match Erl_Variable           '\<[A-Z_][[:alnum:]_@]*'
syn match Erl_IgnoredVariable    '\<_[A-Z][[:alnum:]_@]*'
syn match Erl_StringModifier     '\\\%(\o\{1,3}\|x\x\x\|x{\x\+}\|\^.\|.\)\|\~\%([ni~]\|\%(-\=\d\+\|\*\)\=\.\=\%(\*\|\d\+\)\=\%(\..\)\=[tl]*[cfegswpWPBX#bx+]\)' contained

syn match Erl_NumberInteger '\<\d\+\>'
syn match Erl_NumberInteger '\<\%([2-9]\|[12]\d\|3[0-6]\)\+#[[:alnum:]]\+\>'
syn match Erl_NumberFloat   '\<\d\+\.\d\+\%([eE][+-]\=\d\+\)\=\>'

syn match Erl_Record '#\s*\l[[:alnum:]_@]*'

syn region Erl_String start=/"/  end=/"/  contains=Erl_StringModifier

syn region Erl_Binary matchgroup=Erl_BinaryD start=/<</ end=/>>/ contains=ALL 
syn region Erl_List   matchgroup=Erl_ListD   start=/\[/ end=/]/  contains=ALL 
syn region Erl_Map    matchgroup=Erl_MapD    start=/#{/ end=/}/  contains=ALL 
syn region Erl_Paren  matchgroup=Erl_ParenD  start=/(/  end=/)/  contains=ALL 
syn region Erl_Tuple  matchgroup=Erl_TupleD start=/{/  end=/}/  contains=ALL 
