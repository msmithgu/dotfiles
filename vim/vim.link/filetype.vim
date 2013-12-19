runtime! ftdetect/*.vim
au BufNewFile,BufRead *.mustache  setf mustache
au BufNewFile,BufRead *.clj       setf lisp
au BufRead,BufNewFile Vagrantfile setf ruby

" Execute file being edited with <Shift> + e:
" -------------------------------------------
au BufRead,BufNewFile *.erl       map <buffer> <S-e> :w<CR>:!/usr/bin/env escript % <CR>
au BufRead,BufNewFile *.php       map <buffer> <S-e> :w<CR>:!/usr/bin/env php % <CR>
au BufRead,BufNewFile *.py        map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
au BufRead,BufNewFile *.pl        map <buffer> <S-e> :w<CR>:!/usr/bin/env perl % <CR>
au BufRead,BufNewFile *.ruby      map <buffer> <S-e> :w<CR>:!/usr/bin/env ruby % <CR>
au BufRead,BufNewFile *.rb        map <buffer> <S-e> :w<CR>:!/usr/bin/env ruby % <CR>
au BufRead,BufNewFile *.bash      map <buffer> <S-e> :w<CR>:!/usr/bin/env bash % <CR>
au BufRead,BufNewFile *.lisp      map <buffer> <S-e> :w<CR>:!/usr/bin/env clisp -repl % <CR>
au BufRead,BufNewFile *.js        map <buffer> <S-e> :w<CR>:!/usr/bin/env node % <CR>
au BufRead,BufNewFile *.hs        map <buffer> <S-e> :w<CR>:!/usr/bin/env runhaskell % <CR>
au BufRead,BufNewFile *.clj       map <buffer> <S-e> :w<CR>:!/usr/bin/env clj % <CR>
au BufRead,BufNewFile *.scpt      map <buffer> <S-e> :w<CR>:!/usr/bin/env osascript % <CR>
au BufRead,BufNewFile *.jade      map <buffer> <S-e> :w<CR>:!/usr/bin/env jade % <CR>
au BufRead,BufNewFile Makefile    map <buffer> <S-e> :w<CR>:!/usr/bin/env make <CR>
au BufRead,BufNewFile *.screenrc  map <buffer> <S-e> :w<CR>:!/usr/bin/env screen -c % <CR>
au BufRead,BufNewFile *.coffee    map <buffer> <S-e> :w<CR>:!/usr/bin/env coffee % <CR>
