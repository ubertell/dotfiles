syn clear
syn case match

if !exists("main_syntax")
    if exists("b:current_syntax")
        finish
    endif
    let main_syntax = "heex"
endif

let s:cpo_save = &cpo
set cpo&vim

let b:current_syntax = "heex"

syn include @elixirTop syntax/elixir.vim

syn region  heexString  start=+"+ end=+"+
syn region  heexString  start=+'+ end=+'+

syn region  heexExpression matchgroup=heexDelimiter start="<%"  end="%\@<!%>" contains=@elixirTop  containedin=ALLBUT,@heexRegions keepend
syn region  heexExpression matchgroup=heexDelimiter start="<%=" end="%\@<!%>" contains=@elixirTop  containedin=ALLBUT,@heexRegions keepend
syn region  surfaceExpression matchgroup=surfaceDelimiter start="{{" end="}}" contains=@elixirTop  containedin=ALLBUT,@heexRegions keepend
syn region  surfaceExpression matchgroup=surfaceDelimiter start="{" end="}" contains=@elixirTop  containedin=ALLBUT,@heexRegions keepend
syn region  surfaceExpression matchgroup=surfaceDelimiter start="{" end="}" skip="#{[^}]*}" contains=@elixirTop  containedin=htmlValue keepend
syn region  heexQuote      matchgroup=heexDelimiter start="<%%" end="%\@<!%>" contains=@elixirTop  containedin=ALLBUT,@heexRegions keepend
syn region  heexQuote2      matchgroup=heexDelimiter start="<%%=" end="%\@<!%>" contains=@elixirTop  containedin=ALLBUT,@heexRegions keepend
syn region  heexComment    matchgroup=heexDelimiter start="<%#" end="%\@<!%>" contains=elixirTodo,@Spell containedin=ALLBUT,@heexRegions keepend

syn match heexTag '<\|>'
syn match heexTag '</'
syn match heexTag '/>'

if main_syntax == "heex"
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
