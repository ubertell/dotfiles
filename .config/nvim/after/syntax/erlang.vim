syn clear
syn case match

syn keyword Erl_Keyword after begin case catch cond end fun if let of
syn keyword Erl_Keyword receive when try

syn match Erl_Comment            '%.*$'
syn match Erl_RightArrow         "->"
syn match Erl_Send               "!"
syn match Erl_Colon              ":"
syn match Erl_SemiColon          ";"
syn match Erl_Hash               "#"
syn match Erl_Dot                "\.\s*$"
syn match Erl_StringModifier     '\\\%(\o\{1,3}\|x\x\x\|x{\x\+}\|\^.\|.\)\|\~\%([ni~]\|\%(-\=\d\+\|\*\)\=\.\=\%(\*\|\d\+\)\=\%(\..\)\=[tl]*[cfegswpWPBX#bx+]\)' contained
syn match Erl_QuotedAtomModifier '\\\%(\o\{1,3}\|x\x\x\|x{\x\+}\|\^.\|.\)' contained
syn match Erl_Modifier           '\$\%([^\\]\|\\\%(\o\{1,3}\|x\x\x\|x{\x\+}\|\^.\|.\)\)'
syn match Erl_IgnoredVariable    '\<_[A-Z][[:alnum:]_@]*'

syn region Erl_String     start=/"/ end=/"/ contains=Erl_StringModifier
syn region Erl_QuotedAtom start=/'/ end=/'/ contains=Erl_QuotedAtomModifier
syn region Erl_Paren      matchgroup=Erl_ParenD  start=/(/ end=/)/   contains=ALL
syn region Erl_List       matchgroup=Erl_ListD   start=/\[/ end=/]/  contains=ALL
syn region Erl_Tuple      matchgroup=Erl_TupleD  start=/{/  end=/}/  contains=ALL
syn region Erl_Binary     matchgroup=Erl_BinaryD start=/<</ end=/>>/ contains=ALL
syn region Erl_Map        matchgroup=Erl_MapD    start=/#{/ end=/}/  contains=ALL
" syn region Erl_Record     matchgroup=Erl_RecordD start='#\s*\l[[:alnum:]_@]*{' end='}' contains=ALL

syn match Erl_Record '#\s*\l[[:alnum:]_@]*'

syn match Erl_NumberInteger '\<\d\+\>'
syn match Erl_NumberInteger '\<\%([2-9]\|[12]\d\|3[0-6]\)\+#[[:alnum:]]\+\>'
syn match Erl_NumberFloat   '\<\d\+\.\d\+\%([eE][+-]\=\d\+\)\=\>'

syn match Erl_UnknownAttribute '^\s*-\%(\s\|\n\|%.*\n\)*\l[[:alnum:]_@]*' contains=Erl_Comment
syn match Erl_Attribute '^\s*-\%(\s\|\n\|%.*\n\)*\%(behaviou\=r\|compile\|export\(_type\)\=\|file\|import\|module\|author\|copyright\|doc\|vsn\|on_load\|optional_callbacks\)\>' contains=Erl_Comment
syn match Erl_Include   '^\s*-\%(\s\|\n\|%.*\n\)*\%(include\|include_lib\)\>' contains=Erl_Comment
syn match Erl_RecordDef '^\s*-\%(\s\|\n\|%.*\n\)*record\>' contains=Erl_Comment
syn match Erl_Define    '^\s*-\%(\s\|\n\|%.*\n\)*\%(define\|undef\)\>' contains=Erl_Comment
syn match Erl_PreCondit '^\s*-\%(\s\|\n\|%.*\n\)*\%(ifdef\|ifndef\|else\|endif\)\>' contains=Erl_Comment

syn region Erl_Type start='^\s*-\%(\s\|\n\|%.*\n\)*\%(spec\|type\|opaque\|callback\)\>' end='\.'

