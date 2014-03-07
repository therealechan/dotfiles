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
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'vim-ruby/vim-ruby'
Bundle 'jgdavey/vim-blockle'
Bundle 'godlygeek/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'jgdavey/vim-turbux'
Bundle 'skalnik/vim-vroom'
Bundle 'tpope/vim-vividchalk'
Bundle 'chriskempson/base16-vim'
Bundle 'mileszs/ack.vim'
Bundle 'ggreer/the_silver_searcher'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'goldfeld/vim-seek'
Bundle 'vim-scripts/ZoomWin'
Bundle 'duff/vim-bufonly'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'mattn/gist-vim'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'slim-template/vim-slim'
" Bundle 'scrooloose/syntastic'
" Railscast-theme
" Bundle 'jgdavey/vim-railscasts'

set ignorecase smartcase
set background=dark
set ruler
set langmenu=none

let base16colorspace=256
colorscheme base16-eighties

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
set guifont=Source_Code_Pro_for_Powerline:h15
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
" set guifont=Liberation_Mono_for_Powerline:h17
" set guifont=Ubuntu_Mono_derivative_Powerline:h19
" set guifont=Droid_Sans_Mono_for_Powerline:h17

" syntastic
" let g:syntastic_check_on_open = 1
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_enable_highlighting = 0
" let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }
