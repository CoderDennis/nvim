" from https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/

" Use space for leader
let mapleader = "\<Space>"

" System clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" quickly select current line
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

" avoids getting stuck in that weird macro thing
map q: :q

" from Patrick
imap jj <Esc>

" *** my own additions ***
nnoremap <Leader>W :w<CR>
nnoremap <Leader>q :q<CR>

" cycle buffers (open files)
nmap <Leader>n :bn<CR>
" close current buffer (file)
nmap <Leader>d :bd<CR>

" jump list
nmap <Leader>o <C-o>
nmap <Leader>i <C-i>

" quickly insert a line break
nmap <Leader><CR> i<CR><Esc>

" multiple windows:
" cycle windows after :split or :vsplit
nmap <Leader>w <C-w><C-w>
" make all equal size
nmap <Leader>= <C-w>=
" See https://www.cs.oberlin.edu/~kuperman/help/vim/windows.html for more

