" Sane tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2

set mouse=""

set number " line numbering
set encoding=utf-8

" Highlight search results
set hlsearch
set incsearch
set ignorecase
set smartcase
map <Leader>h :noh<CR>

" highlight cursor postition
" set cursorline
" set cursorcolumn

" set title of terminal
set title

call plug#begin('~/config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  " use tab completion
  inoremap <expr><Tab> pumvisible() ? "\<c-n>" : "\<Tab>"
  inoremap <expr><S-Tab> pumvisible() ? "\<c-p>" : "\<S-Tab>"

" Polyglot loads language support on demand!
Plug 'sheerun/vim-polyglot'
  let g:polyglot_disabled = ['elm']

Plug 'ElmCast/elm-vim'
  let g:elm_format_autosave = 1
  
Plug 'tomasr/molokai'

" Execute code checks, find mistakes, in the background
Plug 'neomake/neomake'
  " Run Neomake when I save any buffer
  autocmd! BufWritePost * Neomake
  " Don't tell me to use smartquotes in markdown ok?
  let g:neomake_markdown_enabled_makers = []

  " Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
  let g:neomake_elixir_enabled_makers = ['mix', 'mycredo']
  function! NeomakeCredoErrorType(entry)
    if a:entry.type ==# 'F'      " Refactoring opportunities
      let l:type = 'W'
    elseif a:entry.type ==# 'D'  " Software design suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'W'  " Warnings
      let l:type = 'W'
    elseif a:entry.type ==# 'R'  " Readability suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'C'  " Convention violation
      let l:type = 'W'
    else
      let l:type = 'M'           " Everything else is a message
    endif
    let a:entry.type = l:type
  endfunction

  let g:neomake_elixir_mycredo_maker = {
        \ 'exe': 'mix',
        \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
        \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
        \ 'postprocess': function('NeomakeCredoErrorType')
        \ }

Plug 'slashmili/alchemist.vim'

Plug 'terryma/vim-expand-region'
  vmap v <Plug>(expand_region_expand)
  vmap <C-v> <Plug>(expand_region_shrink)


call plug#end()

" must be done after end of plug section
set background=dark
syntax enable
colorscheme molokai

" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/

" Use space for leader
let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader><Leader> V

" Make a simple "search" text object.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>
" It allows me to use the following search-and-replace flow:
"    I search things usual way using /something
"    I hit cs, replace first match, and hit <Esc>
"    I hit n.n.n.n.n. reviewing and replacing all matches

nnoremap <CR> G
nnoremap <BS> gg

map q: :q

imap jj <Esc>

nmap <Leader>n :bn<CR>
nmap <Leader>p :bp<CR>

