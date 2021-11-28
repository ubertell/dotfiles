" if exists("b:after_current_buffer")
"  finish
" endif

syn clear
syn case      ignore

syn iskeyword 38,42,43,45,47-58,60-62,64-90,97-122,_

syn match CL_ReaderMacro "#."

syn match  CL_Backquote   "`"
syn match  CL_Comma       ","
syn match  CL_CommaAt     ",@"
syn match  CL_Quote       "'"
syn match  CL_PackageColon ":" contained
syn match  CL_PackageColonContext "\a\+:" contains=CL_PackageColon
syn match  CL_KeywordColon ":" contained
syn match  CL_KeywordColonContext "\H:" contains=CL_KeywordColon
syn match  CL_ParameterModifier /\(&key\|&body\|&rest\|&optional\)/
syn match  CL_Define /\(defclass\|defgeneric\|defmethod\|defun\|defvar\|defparameter\|defstruct\)/
syn match  CL_Scope /\(lambda\|let\|let*\|flet\|labels\)/
syn region CL_List          matchgroup=CL_Paren          start=/(/   end=/)/ contains=ALL
syn region CL_QuoteList     matchgroup=CL_QuoteParen     start=/'(/  end=/)/ contains=ALL
syn region CL_BackquoteList matchgroup=CL_BackquoteParen start=/`(/  end=/)/ contains=ALL
syn region CL_CommaList     matchgroup=CL_CommaParen     start=/,(/  end=/)/ contains=ALL
syn region CL_CommaAtList   matchgroup=CL_CommaAtParen   start=/,@(/ end=/)/ contains=ALL
syn region CL_Vector        matchgroup=CL_VectorParen    start=/#(/  end=/)/ contains=ALL
syn region CL_String matchgroup=CL_StringQuote start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region CL_Comment start=/;/ end=/$/
syn match  CL_Number		"-\=\(\.\d\+\|\d\+\(\.\d*\)\=\)\([dDeEfFlL][-+]\=\d\+\)\="
syn match  CL_Number		"-\=\(\d\+/\d\+\)"

" let b:after_current_buffer = "lisp"
