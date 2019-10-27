set background=dark             " Terminal with a dark background
set t_Co=256
" set expandtab                   " Make a tab to spaces, num of spaces set in tabstop
set shiftwidth=4                " Number of spaces to use for autoindenting
set tabstop=4                   " A tab is four spaces
set nolist                        " show invisible characters
set number                      " Enable line numbers
set numberwidth=3               " Line number width
set swapfile                    " Because some global configs turn it off >_<
set pastetoggle=<F10>
" Set f2 to toggle line numbers
nnoremap <F2> :set nonumber!<CR>
" Set f3 to toggle showing invisible characters
nmap <f3> :set list! list?<cr>

set autoindent
