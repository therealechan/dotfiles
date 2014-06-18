" System vimrc file for MacVim
"
" Maintainer:	Edward Chan <chankaward@gmail.com>

" The default for 'backspace' is very confusing to new users, so change it to a
" more sensible value.  Add "set backspace&" to your ~/.vimrc to reset it.
set backspace+=indent,eol,start

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
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-vividchalk'
Plugin 'chriskempson/base16-vim'
Plugin 'mileszs/ack.vim'
Plugin 'ggreer/the_silver_searcher'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'goldfeld/vim-seek'
Plugin 'vim-scripts/ZoomWin'
Plugin 'duff/vim-bufonly'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mattn/gist-vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'slim-template/vim-slim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
" Plugin 'scrooloose/syntastic'
" Railscast-theme
" Plugin 'jgdavey/vim-railscasts'

call vundle#end()            " required
filetype plugin indent on

set ignorecase smartcase
set background=dark
set ruler
set langmenu=none

let base16colorspace=256
" colorscheme base16-eighties
colorscheme base16-flat

" hi Normal                    guifg=#E6E1DC guibg=#2B2B2B ctermfg=254 ctermbg=NONE

set number
"set guifont=AnonymousProMinus:h18.5
"set guifont=menlo:h16
set noswapfile

set list
set listchars=trail:-,tab:--

set expandtab
set smarttab

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
execute pathogen#infect()

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
" mute the sounds
set visualbell

map <C-t> :NERDTreeToggle<CR>

" hightline the current line
" au WinLeave * set nocursorline nocursorcolumn
" au WinEnter * set cursorcolumn
" set cursorcolumn

set cursorline                  " Highlight current line

"Airline
" set guifont=Source_Code_Pro_for_Powerline:h15
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
" set guifont=Liberation_Mono_for_Powerline:h17
set guifont=Ubuntu_Mono_derivative_Powerline:h20
" set guifont=Droid_Sans_Mono_for_Powerline:h17

" syntastic
" let g:syntastic_check_on_open = 1
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_enable_highlighting = 0
" let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }
