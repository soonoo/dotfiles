set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'flazz/vim-colorschemes'
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'ayu-theme/ayu-vim'
Plugin 'docunext/closetag.vim'
Plugin 'mxw/vim-jsx'
Plugin 'w0rp/ale'
Plugin 'ap/vim-css-color'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'Quramy/tsuquyomi'
Plugin 'kshenoy/vim-signature'
Plugin 'leafgarland/typescript-vim'
Plugin 'udalov/kotlin-vim'
Plugin 'tpope/vim-commentary'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

" render vim background properly in tmux
if &term =~ '256color'
  set t_ut=
endif

set modelines=0		" CVE-2007-2438
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set showcmd
set ruler
set autoindent
set smartindent
set showmatch
set tabstop=2
set shiftwidth=2
set expandtab
set number
set incsearch
set hlsearch
set fileencoding=utf-8
set encoding=utf-8
colorscheme predawn
syntax on 
set cursorline
set relativenumber
set conceallevel=0
set ignorecase
set hidden
set gfn=Meslo\ LG\ M\ for\ Powerline:h14
let g:indentLine_fileTypeExclude = ['json']

let NERDTreeShowHidden=1
let g:airline#extensions#tabline#enabled = 1
let g:NERDTreeWinSize=23
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

let g:ale_fixers = {
\  'javascript': ['eslint'],
\}

let g:ctrlp_custom_ignore = 'node_modules\/'
" syntastic config
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_eslit_exe = 'yarn run lint'
" let g:syntastic_javascript_checkers = ['eslint']
" syntastic config end

" autocmd vimenter * NERDTree
map <expr> <C-n> exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1 ? ':NERDTreeToggle<CR>' : ':NERDTree<CR>'
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
map g1 :b1<cr>
map g2 :b2<cr>
map g3 :b3<cr>
map g4 :b4<cr>
map g5 :b5<cr>
map g6 :b6<cr>
map g7 :b7<cr>

map <C-l> :ALEFix<cr>
map <Leader>y "+y
map <Leader>p "+p

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

" remember cursor position wheh reopening file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
Plugin 'wakatime/vim-wakatime'
