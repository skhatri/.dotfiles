:syn on
:set nu
:set expandtab
:set tabstop=2
:set list

:set background=light
:colorscheme shine

nmap <D-d> yyp
nmap <D-y> dd
nmap <A-S-Up> :m -2<CR>==
nmap <A-S-Down> :m +1<CR>==

nmap <C-,> :m -2<CR>==
nmap <C-.> :m +1<CR>==
nmap <A-,> :m -2<CR>==
nmap <A-.> :m +1<CR>==

" --- Quality of Life Enhancements ---

" Smart Searching
set ignorecase      " Ignore case when searching
set smartcase       " ...unless you type a capital letter!
set incsearch       " Highlight search matches as you type them
set hlsearch        " Keep matches highlighted after you press enter
" Pressing ESC clears search highlights (super useful!)
nnoremap <esc> :noh<return><esc>

" Visual Comfort
set cursorline      " Subtly highlights the entire line your cursor is on
set scrolloff=8     " Keeps 8 lines of context above/below your cursor
set showmatch       " Briefly jumps to the matching bracket/brace

" Safety & Behavior
set autoread        " Automatically reload files changed outside of Vim
set backspace=indent,eol,start " Modern backspace behavior
