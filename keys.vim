" copy this file into $Home/.vsvimrc
"
" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/

" Use space for leader
let mapleader = "\<Space>"

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

" from Patrick
imap jj <Esc>

" my own additions:
nnoremap <Leader>W :w<CR>
nnoremap <Leader>q :q<CR>

nmap <Leader>n :bn<CR>
" nmap <Leader>b :bp<CR>
nmap <Leader>d :bd<CR>

nmap <Leader>o <C-o>
nmap <Leader><CR> i<CR><Esc>


