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
set visualbell         " no beep
set bg=dark            " Dark background
set fdm=manual         " Manual folding (automatic too slow)
set number             " Number lines
set cmdheight=2        " Be able to display errors properly
set laststatus=2       " Always display statusline
set tabstop=3          " If there are tabs, make them 3 spaces long

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
map <F9> :cc
map <F10> :cp
map <F11> :cn

" Completion
inoremap <TAB> 
inoremap <S-TAB> 
set complete-=i

" Setup quickfixsigns
let g:quickfixsigns_classes = ['qfl', 'loc', 'marks', 'breakpoints']

" Pathogen on
execute pathogen#infect()

" Statusline
set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Template settings
let g:templates_no_builtin_templates = 1
let g:templates_directory = '~/.vim/templates'

" Airline customizing
"if $COLORTERM == 'gnome-terminal'
set t_Co=256
"endif
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline#extensions#whitespace#enabled = 0

" Color schema
color darkterm

