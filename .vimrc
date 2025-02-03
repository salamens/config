set nocompatible

let g:mapleader = ' '
set number
set relativenumber
set encoding=utf-8
syntax on
filetype plugin indent on

" security
set modelines=0

" hide buffers, not close them
set hidden

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" case insensitive search
set ignorecase
set smartcase
set infercase

" make backspace behave in a sane manner
set backspace=indent,eol,start

" searching
set hlsearch
set incsearch

" use indents of 4 spaces
set shiftwidth=4

" tabs are tabs
set noexpandtab

" an indentation every four columns
set tabstop=4

" let backspace delete indent
set softtabstop=4

" enable auto indentation
set autoindent

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'thinca/vim-quickrun'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi'
Plug 'github/copilot.vim'
Plug 'chrisbra/unicode.vim'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'matze/vim-move'

" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
call plug#end()

colorscheme catppuccin_mocha

set termguicolors

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" KeyMaps for fuzzy finder
nnoremap <silent><space>b :Buffers<CR>
nnoremap <silent><space>ff :Files<Cr>

" More Keymaps 
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" Source Vim configuration file and install plugins
nnoremap <silent><space>1 :source ~/.vimrc \| :PlugInstall<CR>
"custom binding to see quick uninteractive output:
nnoremap <silent><space>r :QuickRun<CR>

" remove trailing whitespaces and ^M chars
augroup ws
  au!
  autocmd FileType c,cpp,java,php,js,json,css,scss,sass,py,rb,coffee,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
augroup end

" Disable visualbell
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard+=unnamedplus
endif
