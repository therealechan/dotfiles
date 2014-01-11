" Vim color scheme
"
" Name:         railscasts
" Maintainer:   Edward Chan <chankaward@gmail.com>
" Last Change:  8th April 2013
" Version:      1.0
"
" This theme is based on Nick Moffitt's Vim clone of the railscast
" To use for gvim:
" 1: install this file as ~/.vim/colors/railscasts.vim
" 2: put "colorscheme railscasts" in your .gvimrc

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "railscasts"

hi link htmlTag                     xmlTag
hi link htmlTagName                 xmlTagName
hi link htmlEndTag                  xmlEndTag

hi ColorColumn               guibg=#333435 ctermbg=235
hi StatusLine                guibg=#414243 gui=NONE guifg=#E6E1DC
hi StatusLineNC              guibg=#414243 gui=NONE
hi VertSplit                 guibg=#414243 gui=NONE guifg=#414243

hi Normal                    guifg=#E6E1DC guibg=#111111 ctermfg=white ctermbg=234
hi Cursor                    guifg=#000000 ctermfg=0 guibg=#FFFFFF ctermbg=15
hi CursorLine                guibg=#000000 ctermbg=233 cterm=NONE

hi Comment                   guifg=#BC9458 ctermfg=180 gui=italic
hi Constant                  guifg=#6D9CBE ctermfg=73
hi Define                    guifg=#CC7833 ctermfg=173
hi Error                     guifg=#FFC66D ctermfg=221 guibg=#990000 ctermbg=88
hi Function                  guifg=#FFC66D ctermfg=221 gui=NONE cterm=NONE
hi Identifier                guifg=#6D9CBE ctermfg=73 gui=NONE cterm=NONE
hi Include                   guifg=#CC7833 ctermfg=173 gui=NONE cterm=NONE
hi PreCondit                 guifg=#CC7833 ctermfg=173 gui=NONE cterm=NONE
hi Keyword                   guifg=#CC7833 ctermfg=173 cterm=NONE
hi LineNr                    guifg=#888888 ctermfg=242
hi Number                    guifg=#A5C261 ctermfg=107
hi PreProc                   guifg=#E6E1DC ctermfg=103
hi Search                    guifg=NONE ctermfg=NONE guibg=#2b2b2b ctermbg=235 gui=italic cterm=underline
hi Statement                 guifg=#CC7833 ctermfg=173 gui=NONE cterm=NONE
hi String                    guifg=#A5C261 ctermfg=107
hi Title                     guifg=#FFFFFF ctermfg=15
hi Type                      guifg=#DA4939 ctermfg=167 gui=NONE cterm=NONE
hi Visual                    guibg=#5A647E ctermbg=60

hi DiffAdd                   guifg=#E6E1DC ctermfg=7 guibg=#519F50 ctermbg=71
hi DiffDelete                guifg=#E6E1DC ctermfg=7 guibg=#660000 ctermbg=52
hi Special                   guifg=#DA4939 ctermfg=167 

hi pythonBuiltin             guifg=#6D9CBE ctermfg=73 gui=NONE cterm=NONE
hi rubyBlockParameter        guifg=#FFFFFF ctermfg=15
hi rubyClass                 guifg=#FFFFFF ctermfg=15
hi rubyConstant              guifg=#DA4939 ctermfg=167
hi rubyInstanceVariable      guifg=#D0D0FF ctermfg=189
hi rubyInterpolation         guifg=#519F50 ctermfg=107
hi rubyLocalVariableOrMethod guifg=#D0D0FF ctermfg=189
hi rubyPredefinedConstant    guifg=#DA4939 ctermfg=167
hi rubyPseudoVariable        guifg=#FFC66D ctermfg=221
hi rubyStringDelimiter       guifg=#A5C261 ctermfg=143

hi xmlTag                    guifg=#E8BF6A ctermfg=179
hi xmlTagName                guifg=#E8BF6A ctermfg=179
hi xmlEndTag                 guifg=#E8BF6A ctermfg=179

hi mailSubject               guifg=#A5C261 ctermfg=107
hi mailHeaderKey             guifg=#FFC66D ctermfg=221
hi mailEmail                 guifg=#A5C261 ctermfg=107 gui=italic cterm=underline

hi SpellBad                  guifg=#D70000 ctermfg=160 ctermbg=NONE cterm=underline
hi SpellRare                 guifg=#D75F87 ctermfg=168 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi SpellCap                  guifg=#D0D0FF ctermfg=189 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi MatchParen                guifg=#FFFFFF ctermfg=15 guibg=#005f5f ctermbg=23

hi SpecialKey                ctermfg=77 guifg=#696969
