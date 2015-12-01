set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "darkterm"

hi javaDocComment ctermfg=gray
hi javaCommentStar ctermfg=gray
hi javaLineComment ctermfg=gray
hi javaCommentTitle ctermfg=lightgray
hi javaDocTags ctermfg=white
hi javaDocParam ctermfg=white
hi clear SignColumn

