call plug#begin()

Plug 'folke/tokyonight.nvim'
Plug 'alx741/vim-rustfmt'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'uga-rosa/ccc.nvim', {'branch': '0.7.2'}

call plug#end()

colorscheme tokyonight

set path+=**
set wildmenu
set encoding=utf-8
set nu
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nohlsearch
set incsearch
set autoindent
set smartindent
set scrolloff=8
set nowrap
set termguicolors
set noswapfile
set nobackup
set undodir="$HOME/.local/share/nvim/undo/"
set undofile

autocmd Filetype html setlocal ts=2 sw=2 sts=2
autocmd Filetype css setlocal ts=2 sw=2 sts=2

let mapleader=" "

let g:netrw_banner=0
let g:netrw_winsize=12
let g:netrw_liststyle=3

" Spawn netrw on side
nnoremap <leader>e <cmd>Ex<CR>

" Spawn terminal
nnoremap <F5> <cmd>split term://bash<CR><C-w>J7<C-w>-i
inoremap <F5> <Esc><cmd>split term://bash<CR><C-w>J7<C-w>-i
vnoremap <F5> <Esc><cmd>split term://bash<CR><C-w>J7<C-w>-i

" Close terminal
tnoremap <F5> <C-\><C-n><cmd>q<CR>

" Open color picker
nnoremap <leader>cp <cmd>CccPick<CR>

" Create a new html file
nnoremap <leader>html :-1read ~/.config/nvim/templates/html<CR>5j3wa


function! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ CheckBackSpace() ? "\<Tab>" :
	\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
