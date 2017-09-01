" Sane tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
set expandtab           " Expand them all
set shiftwidth=2        " Indent by 2 spaces by default

set mouse=""

set number              " line numbering
set relativenumber      " Relative numbering
set encoding=utf-8
set noswapfile          " No swap file
set nobackup            " No backup
set nowb                " No write-backup

" Highlight search results
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <Leader>h :noh<CR>

" highlight cursor postition
set cursorline
" set cursorcolumn

" set title of terminal
set title

source .\plug.vim

source .\keys.vim

nmap <Leader>t :!elm-test<CR>
