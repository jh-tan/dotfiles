syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set nu
set nowrap
set smartcase
set incsearch
set scrolloff=8
set signcolumn=yes
set relativenumber
set backspace=indent,eol,start
set hidden

call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tmsvg/pear-tree'
    Plug 'joshdick/onedark.vim'
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdcommenter'
    Plug 'easymotion/vim-easymotion'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'chriskempson/base16-vim'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
call plug#end()

let mapleader = ","

"set termguicolors
highlight Normal guibg=NONE guifg=NONE
let g:airline_theme='onedark'

" Cursor options
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" Optionally reset the cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Map ALT
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

" Move line 
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" fzf shortcut
nnoremap <silent> <C-f> :Files<CR>
inoremap <silent> <C-f> <ESC>:Files<CR>

" fzf search lines in loaded buffers
nnoremap <leader>F :Lines<CR>

" fzf search lines in current buffers
nnoremap <leader>f :BLines<CR>

" fzf open buffers
nnoremap <leader><space> :Buffers<CR>

" Navigate within/between line
nnoremap H ^
nnoremap L g_
nnoremap <leader>1 %
vnoremap H ^
vnoremap L g_
vnoremap <leader>1 %

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" Highlight the line without the newline character
nnoremap vil ^v$h

" Yank line without the newline character
nnoremap <leader>y ^y$

" Paste over without overwriting register
xnoremap <A-p> "_dP

" Navigate between buffer
nnoremap <A-q> :bprevious<CR>
nnoremap <A-e> :bnext<CR>
nnoremap <A-w> :bp <BAR> bd #<CR>
inoremap <A-q> <ESC>:bprevious<CR>
inoremap <A-e> <ESC>:bnext<CR>
inoremap <A-w> <ESC>:bp <BAR> bd #<CR>

" Write and quit all
nnoremap <leader>wq :wqa<CR>

" Write all without quit
nnoremap <leader>ww :wa<CR>

" Quit all without write
nnoremap <leader>qq :qa!<CR>

" Navigate windows
nnoremap <A-l> <C-W>l
nnoremap <A-h> <C-W>h
nnoremap <A-a>j <C-W>j
nnoremap <A-a>k <C-W>k

" Remap esc
inoremap jk <Esc>
inoremap kj <Esc>

" use <tab> for trigger completion and navigate to the next complete item
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Open terminal
nnoremap <leader>` :wa<CR>:term<CR>

" Remap terminal normal mode
tnoremap kj <C-\><C-n>
tnoremap jk <C-\><C-n>

" Remap resize
nnoremap <A-a><Up> <C-w>+
nnoremap <A-a><Down> <C-w>-

"Remap rotate position
nnoremap <A-a>r <C-w>r

set timeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=50

" peartree configuration
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_pairs = {
    \'<*>': {'closer': '</*>','not_if':['br','img','string','String','int','double','bool','vector<int>']}, 
    \ '(': {'closer': ')'},
    \ '[': {'closer': ']'},
    \ '{': {'closer': '}'},
    \ "'": {'closer': "'"},
    \ '"': {'closer': '"'}
    \ }
" nerdtree configuration
nmap <leader>t :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p
let NERDTreeShowHidden=1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Prettier config
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'

