require('helpers/augroup')

augroup('elixir', {
    'filetype elixir setlocal shiftwidth=2 tabstop=2 expandtab'
})

augroup('erlang', {
    'filetype erlang setlocal shiftwidth=4 tabstop=4 expandtab', 
    'BufRead,BufNewFile *.{app,app.src,rel,config} set filetype=erlang' 
})

augroup('c', { 
    'filetype c setlocal shiftwidth=2 tabstop=2 expandtab'
})

augroup('css', {
    'filetype css setlocal shiftwidth=2 tabstop=2 expandtab'
})

augroup('html', {
    'filetype html setlocal shiftwidth=2 tabstop=2 expandtab'
})

augroup('lua', { 
    'filetype lua setlocal shiftwidth=2 tabstop=2 expandtab'
})

augroup('yaml', {
    'filetype yaml setlocal shiftwidth=2 tabstop=2 expandtab'
})

augroup('typescript', { 
    'filetype typescript setlocal shiftwidth=2 tabstop=2 expandtab'
})

augroup('javascript', { 
    'filetype javascript setlocal shiftwidth=2 tabstop=2 expandtab'
})
