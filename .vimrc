
" Turn on line numbers
set number

" Highlight when a line is > 80 chars
highlight Overlength ctermbg=darkred ctermfg=white guibg=#592525
match Overlength /\%81v.\+/

" Bind F4 to search in curr directory for word on current cursor
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Show row / col always
"set ruler

" How many lines of history VIM has to remember
set history=700

" Default to ignore case when searching, unless cap letter in search term
set ignorecase
set smartcase

" Set incremental search
set incsearch

" Highlight search results
set hlsearch

" Smart indentation in C
set autoindent
set cindent
filetype plugin on
filetype indent on
"inoremap # #
	
" Wrap lines
set wrap

" Keep 7 line context when scrolling
set scrolloff=5

" Shortcuts for C comments
ab #b /********************************************************************************
ab #e ********************************************************************************/

" Tab completions
"set wildmode=longest,list
set wildmenu


" Set to auto read when a file is changed from the outside
set autoread

" Always show the status line
"set laststatus=2

" Regexp magic
set magic

autocmd FileType html setlocal shiftwidth=2 tabstop=2

color elflord

" set tabstop=4
" set shiftwidth=4
" set expandtab

let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile"
        set noexpandtab
else
        set expandtab
endif


function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END

" In most of my projects, the ctags file is one directory above the src
set tags=../tags

