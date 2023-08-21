set lazyredraw number relativenumber nocompatible tabstop=4 shiftwidth=4 cursorline ignorecase smartcase
set backspace=indent,eol,start

noremap O n
noremap N N

noremap n h
noremap i gk
noremap k e
noremap e gj
noremap j n
noremap o l

noremap l o
noremap L O
noremap $ g$
noremap ^ g^
noremap t f
noremap f t
noremap F T
noremap a F
noremap S :%s/
noremap <C-I> <C-B>
noremap <C-E> <C-F>
nnoremap U <C-R>
nnoremap Y y$
nnoremap <CR> :
nnoremap <SPACE> i
nnoremap <BS> a
nnoremap dr da
nnoremap cr ca
nnoremap yr ya
nnoremap ds di
nnoremap cs ci
nnoremap ys yi
nnoremap f<SPACE> f<SPACE>
nnoremap f<CR> f<CR>
nnoremap F<SPACE> F<SPACE>
nnoremap F<CR> F<CR>
nnoremap > >>
nnoremap < <<
nnoremap <C-S> :w<CR>
nnoremap ,p "+p
nnoremap ,P "+P
noremap ,y "+y
noremap ,Y "+y$
cnoremap %,y <ESC>ggVG"+y
cnoremap %,d <ESC>ggVG"+d
noremap ,d "+d
noremap ,D "+D
noremap ze zj
noremap zi zk
noremap zn za

nnoremap zE zR
nnoremap zI zM
nnoremap zI zM
command Q qa
command WQ wqa
command W wa


"noremap b :echo "Use 'W' instead"<CR>
command! Con source ~/.config/nvim/con.vim
command! Coff source ~/.config/nvim/coff.vim
command! Fon source ~/.config/nvim/fon.vim
command! Foff source ~/.config/nvim/foff.vim
command! Gon source ~/.config/nvim/gon.vim
command! Goff source ~/.config/nvim/goff.vim
command! R source ~/.config/nvim/init.vim
"au filetype cpp :iabbrev for for(int<space>i=0;<space>i<0;<space>i++){<CR><TAB><CR>}<UP><Right><BS>
" cnoremap make<space>b<CR> :w<CR>:make<space>b<CR>
" cnoremap make<space>br<CR> :w<CR>:make<space>br<CR>
set statusline=\ %f%=\ %c:%l\ %P\ 

set foldnestmax=1 foldmethod=syntax
set foldcolumn=1
let g:markdown_folding = 1


if (expand('%:e')=="tex")
	set spell
	nnoremap <C-T> :w<CR>:!pdflatex -interaction=batchmode "%"<CR><CR>
elseif (expand('%:e')=="m")
	nnoremap <C-T> :w<CR>:AsyncRun -mode=term octave -q --persist $HOME/.config/octave/octave_conf.m $VIM_FILEPATH<CR><CR>
elseif (expand('%:e')=="py")
	set foldnestmax=1 foldmethod=indent
	nnoremap <C-T> :w<CR>:AsyncRun -mode=term python -i $VIM_FILEPATH<CR><CR>
elseif (expand('%:e')=="sh")
	set foldnestmax=1 foldmethod=syntax
	nnoremap <C-T> :w<CR>:AsyncRun -mode=term $VIM_FILEPATH<CR><CR>
elseif (expand('%:e')=="gd")
	packadd commentary
	setlocal commentstring=#\ %s
	packadd vim-godot-master
	set foldnestmax=1 foldmethod=indent
elseif (expand('%:e')=="gdshader")
	packadd vim-godot-master
	set foldnestmax=1 foldmethod=marker
	set foldmarker={,}
else
	nnoremap <C-T> :w<CR>:make<SPACE>
endif

syntax enable

autocmd VimEnter * if executable('git')
  \ | let gitroot = systemlist('git rev-parse --show-toplevel')[0]
  \ | if v:shell_error == 0 && isdirectory(gitroot)
  \ |   exe 'cd ' . gitroot
  \ | endif
  \ | endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" function! CustomComplete(arglead, cmdline, cursorpos)
"   let issues = systemlist('git issue list')
"   let matches = []

"   for issue in issues
"     let hash = matchstr(issue, '^[^ ]*') 
"     let name = matchstr(issue, ' \zs.*$')
"     call add(matches, hash . name)
"   endfor

"   return matches
" endfunction

" function! CustomCompleteFilter(item)
"   return matchstr(a:item, '^[^ ]*')
" endfunction

" command! -nargs=* -complete=customlist,CustomComplete GitIssueEdit :Git issue edit
"             \ -complete=custom,CustomCompleteFilter
