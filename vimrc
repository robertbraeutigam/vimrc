" Vimrc file

filetype plugin on     " Search plugins per filetype in ftplugin
filetype indent on     " Search indent extensions automatically

" Comfortable stuff
set nowrap             " Don't wrap lines
set bs=2               " Power to backspace
set sw=3               " Indent is 3 spaces
set expandtab          " Tabs shall be spaces
set nobk               " No backup files 
set showcmd            " Show current command
set novb               " No visual bell
set bg=dark            " Dark background
set fdm=manual         " Manual folding (automatic too slow)
set number             " Number lines
set cmdheight=2        " Be able to display errors properly
set laststatus=2       " Always display statusline
set tabstop=3          " If there are tabs, make them 3 spaces long
set nocompatible
set modeline

" Syntax highlight
syntax on

" Buffer stuff (next,prev,write,edit,delete)
map <F6> :bn<CR>
map <S-F6> :bp<CR>
map <F2> :w<CR>
map <F3> :e 
map <F12> :bdelete<CR>

imap <F6> :bn<CR>li
imap <S-F6> :bp<CR>li
imap <F2> :w<CR>li
imap <F3> :e 
imap <F12> :bdelete<CR>li

" Quickfix issues
map <F8> :cp
map <F9> :cc
map <F10> :cn

" Completion
inoremap <TAB> 
inoremap <S-TAB> 
set complete-=i

" Setup quickfixsigns
let g:quickfixsigns_classes = ['loc', 'marks', 'breakpoints', 'qfl']

" Pathogen on
execute pathogen#infect()

" Airline customizing
"if $COLORTERM == 'gnome-terminal'
set t_Co=256
"endif
"let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Airline customizing: If there are quickfixes, display the count in the
" warning section
function! GetQuickfixMessage()
   return ''.len(getqflist()).' Problems'
endfunction
function! AirlineInit()
   call airline#parts#define_function('quickfixes', 'GetQuickfixMessage')
   call airline#parts#define_condition('quickfixes', '!empty(getqflist())')
   let g:airline_section_error = airline#section#create(['quickfixes'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" Append modeline after last line in buffer.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Template settings
let g:templates_no_builtin_templates = 1
let g:templates_directory = '~/.vim/templates'

" Color schema
color darkterm

" Missing filetypes
au BufRead,BufNewFile *.scala set filetype=scala
au BufRead,BufNewFile *.scala set ai

" Haskell
au BufRead *.hs set foldmethod=marker

" Java quickfix
map <silent> <F4> :call QuickfixSuggestImport()<CR>
imap <silent> <F4> :call QuickfixSuggestImport<CR>li
