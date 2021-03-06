set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle')

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
Plugin 'terryma/vim-multiple-cursors'
Plugin 'prettier/vim-prettier'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ollykel/v-vim'
Plugin 'vim/killersheep'
Plugin 'fatih/vim-go'
Plugin 'junegunn/fzf.vim'

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
"if &term =~ '256color'
 " set t_ut=
"endif

set modelines=0		" CVE-2007-2438
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set showcmd
set ruler
set autoindent
set smartindent
set showmatch

" http://vimcasts.org/episodes/tabs-and-spaces/
set tabstop=2
set softtabstop=2
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
set updatetime=100
set shortmess-=S

" auto-import for golang
let g:go_fmt_command = "goimports"

" hide '-- INSERT --' text in status line when entering insert mode
set noshowmode

" display YouCompleteMe preview pane in bottom
" https://github.com/ycm-core/YouCompleteMe/issues/1765
set splitbelow

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" save undo/redo history
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undofile
set undodir=~/.vim/undo/

let NERDTreeShowHidden=1
let g:airline#extensions#tabline#enabled = 1
let g:NERDTreeWinSize=36
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

let g:ale_fixers = {
\  'javascript': ['eslint'],
\}

" refresh automatically when CtrlP is opened
" https://stackoverflow.com/questions/8663829/vim-ctrlp-vim-plugin-how-to-rescan-files
let g:ctrlp_use_caching = 0

" https://github.com/kien/ctrlp.vim/issues/58
let g:ctrlp_custom_ignore = '\v[\/](node_modules|repos|dist)|(\.(swp|ico|git|svn))$'
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

" vim-multiple-cursor key bindings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key='<C-i>'
let g:multi_cursor_next_key='<C-i>'

" if has('cscope')
"   set cscopetag cscopeverbose

"   if has('quickfix')
"     set cscopequickfix=s-,c-,d-,i-,t-,e-
"   endif

"   cnoreabbrev csa cs add
"   cnoreabbrev csf cs find
"   cnoreabbrev csk cs kill
"   cnoreabbrev csr cs reset
"   cnoreabbrev css cs show
"   cnoreabbrev csh cs help

"   command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
" endif
" copy&paste from/to system clipboard with `,y` and `,p`
let mapleader=","
map <Leader>y "+y
map <Leader>p "+p

set swapfile
set dir=~/vim-tmp

" Don't write backup file if vim is being called by crontab -e
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by chpass
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

hi CursorLineNr    term=bold cterm=bold gui=bold

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size=2
hi IndentGuidesOdd  guibg=lightgray ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4

" remember cursor position wheh reopening file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif
