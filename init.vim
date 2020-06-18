set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.config/nvim/bundle/Vundle.vim
" call vundle#begin('~/.config/nvim/bundle')
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript'
Plug 'flazz/vim-colorschemes'
" Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ayu-theme/ayu-vim'
Plug 'docunext/closetag.vim'
Plug 'mxw/vim-jsx'
Plug 'tasn/vim-tsx'
Plug 'w0rp/ale'
Plug 'ap/vim-css-color'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'Quramy/tsuquyomi'
Plug 'kshenoy/vim-signature'
Plug 'leafgarland/typescript-vim'
Plug 'udalov/kotlin-vim'
Plug 'tpope/vim-commentary'
Plug 'prettier/vim-prettier'
Plug 'ollykel/v-vim'
Plug 'vim/killersheep'
" Plug 'fatih/vim-go'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf'
Plug 'janko/vim-test'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'editorconfig/editorconfig-vim'
Plug 'evanleck/vim-svelte'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'rakr/vim-colors-rakr'
Plug 'majutsushi/tagbar'
Plug 'isobit/vim-caddyfile'
" Plug 'rafalbromirski/vim-aurora'

call plug#end()
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

set tags=/Users/kakao_ent/dev/groot/apiapps/tags

set modelines=0		" CVE-2007-2438
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set showcmd
set ruler
set autoindent
set smartindent
set showmatch

" http://vimcasts.org/episodes/tabs-and-spaces/
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set number
set incsearch
set hlsearch
set fileencoding=utf-8
set encoding=utf-8
set termguicolors
" set background=dark
" colorscheme aurora
colorscheme predawn
set t_Co=256
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
let g:airline_theme='luna'

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


autocmd FileType jsx setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" autocmd vimenter * NERDTree
map <expr> <C-n> exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1 ? ':NERDTreeToggle<CR>' : ':NERDTree<CR>'
map gn :bn<cr>
map gp :bp<cr>
map gd :bd!<cr>
map g1 :b1<cr>
map g2 :b2<cr>
map g3 :b3<cr>
map g4 :b4<cr>
map g5 :b5<cr>
map g6 :b6<cr>
map g7 :b7<cr>

map <C-l> :ALEFix<cr>
map <C-p> :FZF<cr>


" scroll throug vim-test result
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

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
map <Leader>t :TestFile<cr>
map <Leader>u :TestFile -u<cr>

set swapfile
set dir=~/vim-tmp
set mouse=nicr

" Don't write backup file if vim is being called by crontab -e
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by chpass
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

hi CursorLineNr    term=bold cterm=bold gui=bold
" hi Pmenu ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#000000 gui=NONE
" hi PmenuSel ctermfg=NONE ctermbg=17 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

let g:loaded_python3_provider = 0

" coc.nvim
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set signcolumn=yes

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

nmap <silent> td <Plug>(coc-definition)
nmap <silent> ty <Plug>(coc-type-definition)
nmap <silent> ti <Plug>(coc-implementation)
nmap <silent> tr <Plug>(coc-references)
