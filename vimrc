" System vimrc file for MacVim
"
" Maintainer:	Edward Chan <chankaward@gmail.com>

" The default for 'backspace' is very confusing to new users, so change it to a
" more sensible value.  Add 'set backspace&' to your ~/.vimrc to reset it.
set backspace=indent,eol,start

" Disable localized menus for now since only some items are translated (e.g.
" the entire MacVim menu is set up in a nib file which currently only is
" translated to English).

set nocompatible
" auto reload file after change
set autoread
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'tpope/timl'
Plugin 'vim-ruby/vim-ruby'
Plugin 'jgdavey/vim-blockle'
Plugin 'godlygeek/tabular'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'jgdavey/vim-turbux'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion' " ,,w
Plugin 'duff/vim-bufonly'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mattn/gist-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'slim-template/vim-slim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rizzatti/dash.vim'
Plugin 'mattn/emmet-vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'chankaward/vim-railscasts-theme'
Plugin 'bling/vim-airline'
Plugin 'suan/vim-instant-markdown'
Plugin 'elixir-lang/vim-elixir'
Plugin 'tomlion/vim-solidity'
" Plugin 'scrooloose/syntastic'

" Snipmate requirements
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Snipmate settings
let g:snipMate = { 'snippet_version' : 1 }

call vundle#end()            " required
filetype plugin indent on

set ignorecase smartcase
set background=dark
set ruler
set langmenu=none
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set hidden
set number
set noswapfile
set list
set listchars=trail:-,tab:--
set smarttab
set expandtab
set laststatus=2
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set textwidth=0
set hidden
set shell=zsh
set wildmenu
set wildmode=list:longest,full
set splitright
set splitbelow
set incsearch
set visualbell                  " mute the sounds
set cursorline                  " Highlight current line
set hlsearch                    " Highlighting search matches
set showmatch

" Ctrl C + l to clean search result
noremap <silent> <c-l> :nohls<cr><c-l>

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

colorscheme railscasts

" gitgutter
let g:gitgutter_escape_grep = 1

" ctrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

imap ( ()<esc>i

syntax on
filetype plugin indent on

let mapleader=","
map <Leader>spe :set syntax=perl   ai et ts=4 sw=4 tw=0<CR>
map <Leader>spy :set syntax=python ai et ts=4 sw=4 tw=0<CR>
map <Leader>sr  :set syntax=ruby   ai et ts=2 sw=2 tw=0<CR>

" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END
" }}}

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
noremap F %
vnoremap L g_

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]

" Indent/dedent/autoindent what you just pasted.
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=

" NerdTree
map <C-t> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline = 1

" Supertab {{{

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabLongestHighlight = 1
let g:SuperTabCrMapping = 1

"}}}

" Surround {{{
let g:surround_{char2nr('%')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('8')} = "/* \r */"
let g:surround_{char2nr('s')} = " \r"
let g:surround_{char2nr('^')} = "/^\r$/"
let g:surround_indent = 1
"}}}

" emmet To remap the default <C-Y> leader:
let g:user_emmet_leader_key='<C-Z>' " ctrl + z + ,

" Ruby complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" Ag with ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]

" Great for pasting
nnoremap vv ^vg_

" Indent Guides {{{
let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
hi def IndentGuides guibg=#303030 ctermbg=234
nnoremap <leader>I :call IndentGuides()<cr>
" }}}

" hightline the current line
" au WinLeave * set nocursorline nocursorcolumn
" au WinEnter * set cursorcolumn
" set cursorcolumn

" Airline
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
set guifont=input:h13

" syntastic
" let g:syntastic_check_on_open = 1
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_enable_highlighting = 0
" let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }

" vim-javascript setting
set regexpengine=1

" vim markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Fugitive
map <Leader>gs :Gstatus<cr>
map <Leader>gd :Gdiff<cr>
map <leader>gc :Gcommit<cr>
map <leader>gb :Gblame<cr>
map <leader>gl :Glog<cr>
map <leader>gp :Git push<cr>

" Instant Markdown
"   This will cause vim-instant-markdown to only refresh on the following events:
"     - No keys have been pressed for a while
"     - A while after you leave insert mode
"     - You save the file being edited
let g:instant_markdown_slow = 1
