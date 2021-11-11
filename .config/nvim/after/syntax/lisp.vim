if exists("b:this_syntax")
 finish
endif

syn clear
syn case      ignore

syn iskeyword 38,42,43,45,47-58,60-62,64-90,97-122,_

syn match CL_BQ       "`"
syn match CL_Comma    ","
syn match CL_CommaAt  ",@"
syn match CL_Q        "'"
syn match CL_Hash     "#"
syn match CL_Function "#'"

syn region CL_List   matchgroup=CL_Paren   start=/(/  end=/)/ contains=ALL
syn region CL_QList  matchgroup=CL_QParen  start=/'(/ end=/)/ contains=ALL
syn region CL_BQList matchgroup=CL_BQParen start=/`(/ end=/)/ contains=ALL

syn region CL_String matchgroup=CL_StringQ start=+"+ skip=+\\\\\|\\"+ end=+"+

syn region CL_Comment start=/;/ end=/$/

let b:this_syntax = "lisp"
