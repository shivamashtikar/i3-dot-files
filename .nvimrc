
" Use deoplete.
let g:deoplete#enable_at_startup = 1

let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1

nnoremap <S-q> :q!<CR>
noremap <S-y> "+y
noremap <S-p> "+p
noremap <S-s> :w<CR>
noremap <S-f> :Bolt<CR>

"colorscheme fahrenheit
"colorscheme orbital


" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowCollapsible = ''


set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set mouse=a
set nocompatible " Set compatibility to Vim only.
filetype off " Helps force plug-ins to load correctly when it is turned back on below.
syntax on " Turn on syntax highlighting.
filetype plugin indent on " For plug-ins to load correctly.
set modelines=0 " Turn off modelines

" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

set wrap " Automatically wrap text that extends beyond the screen length.
set linebreak "Avoid wrapping a line in the middle of a word
" set textwidth=79 " Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set scrolloff=5 " Display 5 lines above/below the cursor when scrolling with a mouse.
set backspace=indent,eol,start " Fixes common backspace problems
set ttyfast " Speed up scrolling in Vim
set laststatus=2 " Status bar
set cursorline "Highlight the line currently under cursor.
set backupdir=~/.cache/vim " Directory to store backup files.h
set confirm "Display a confirmation dialog when closing an unsaved file.


" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number


" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview"


let g:ale_linters = {'haskell': ['hlint', 'ghc']}
let g:ale_haskell_ghc_options = '-fno-code -v0 -isrc'

highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1


function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

"Clipboard
"-------------------------
if has("xterm_clipboard")
  vnoremap <C-c> "+y
  inoremap <C-v> <Esc>"+p i
elseif executable('xclip')
  vnoremap <C-c> :!xclip -f -sel clip <CR>
  inoremap <C-v> <Esc>:r!xclip -o -sel clip <CR>
endif

"Ctrl-O/P to open files
"-------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_lazy_update = 10
nnoremap <C-o> :CtrlPBuffer<CR>
inoremap <C-o> <Esc>:CtrlPBuffer<CR>



"Run HLint
nnoremap <C-h> :!hlint %<CR>

"Ghcide
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['ghcide', '--lsp'],
    \ }

"Call language server
nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>



let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Ranger
map <leader>f :Ranger<CR>

" vim-markdown
let g:vim_markdown_folding_disabled = 1 " dissable folding
set conceallevel=2 " concealing text For example, conceal [link text](link url) as just link text.

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" **************** Competitve Coding *****************
"
"
" Template
autocmd BufNewFile *.cpp -r ~/template.cpp
"" Compile/Run C++
nnoremap gb :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && time g++ -g -std=c++17 -Wall -Wextra -Wno-unused-result -D LOCAL -O2 %:r.cpp -o %:r 2>&1 \| tee %:r.cerr && printf "\n================\n   Running...\n================\n" && time ./%:r < %:r.in > %:r.out 2> %:r.err && printf "\n\n\n\n"<CR>
