let g:mapleader = "\<Space>" " Leaderキーをスペースに設定

syntax enable
filetype plugin indent on

set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set belloff=all
set smartindent autoindent
set incsearch
set ignorecase
set smartcase
set hlsearch
set undolevels=1000
set cursorline
set wildmenu
set noswapfile
set nobackup
set number
set tabstop=2
set shiftwidth=2
set expandtab
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set laststatus=0
set noshowmode

augroup fileTypeIndent
  au!
  au FileType go setlocal tabstop=4 shiftwidth=4
  au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'mattn/vim-goimports'
Plug 'preservim/nerdtree'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

call plug#end()

" タブ切り替え
nnoremap <C-l> gt
nnoremap <C-h> gT

" true color
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" theme
colorscheme nord

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" nerdTree
nnoremap <silent><C-n> :NERDTreeToggle<CR>

" vim-lsp
if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" undo
if has('persistent_undo')
  let undo_path = expand('~/.vim/undo')
  if !isdirectory(undo_path)
         call mkdir(undo_path, 'p')
  endif
    let &undodir = undo_path
    set undofile
endif

