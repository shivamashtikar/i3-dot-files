let mapleader=" "
let maplocalleader = ","

set shell=/bin/bash

" Change the colors if you want
" highlight default link WhichKey          Operator
" highlight default link WhichKeySeperator DiffAdded
" highlight default link WhichKeyGroup     Identifier
" highlight default link WhichKeyDesc      Function

" Leader key to trigger vim-which-key
" pass leader key to WhichKey
call which_key#register(' ', "g:leader_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual  '<Space>'<CR>

call which_key#register(',', "g:localleader_map")
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual  ','<CR>

set timeoutlen=500
let g:leader_map = {}
let g:localleader_map = {}

" Use system Clipboard
set clipboard+=unnamedplus

" Trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Enable spell checking, s for spell check
map <localleader>s :setlocal spell! spelllang=en_us<CR>
let g:leader_map['s'] = 'toggle spell checking'

" Use alt + hjkl split navigation
map <M-h> <C-w>h
map <M-j> <C-w>j
map <M-k> <C-w>k
map <M-l> <C-w>l

" Shortcut ctrl + hjkl for to resize windows
nnoremap <C-j> : resize -2<CR>
nnoremap <C-k> : resize +2<CR>
nnoremap <C-h> : vertical resize -2<CR>
nnoremap <C-l> : vertical resize +2<CR>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
let g:leader_map['='] = 'balance windows'
let g:leader_map['-'] =  'Maximize current pane'

let g:leader_map['z'] = [ ':Goyo' , 'Goyo Zen mode' ]
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Shortcut split opening
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>
let g:leader_map['h'] = 'Horizontal split'
let g:leader_map['v'] = 'Vertical slit'

" Fix splitting
set splitbelow splitright

" Path current directory and sub folders
set path+=**
" Autocompletion commands
set wildmode=longest,list,full

" Clear the search with ,/
nmap <silent> <localleader>/ :nohlsearch<CR>
let g:localleader_map['/'] = 'Clear search'

" Alias write and quit to Q
let g:leader_map['q'] = {
  \ 'name' : '+quit',
  \ 'a' : [':qa'     , 'Quit all window'    ] ,
  \ 'w' : [':q'      , 'Quit window'        ] ,
  \ 'q' : [':Bclose' , 'Quit buffer'        ] ,
  \ 'o' : ['<C-w>o'  , 'Close other window' ] ,
  \ }
nnoremap <leader>w :w<CR>
let g:leader_map['w'] = 'Write buffer'

let g:leader_map['b']={ 'name' : '+buffer' }
nnoremap <silent> <Leader>bp :bprevious<CR>
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bf :bfirst<CR>
nnoremap <silent> <Leader>bl :blast<CR>
nnoremap <silent> <Leader>bk :bw<CR>


" Shift + u for redo
noremap <S-u> <C-r>

" === Deoplete ===
" Use deoplete at startup
" let g:deoplete#enable_at_startup = 1
" deoplete-clang
" # On GNU/Linux
" $ sudo find / -name libclang.so
" # On macOS
" $ mdfind -name libclang.dylib
" let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
" let g:deoplete#sources#clang#clang_header='/usr/lib/clang'
" call deoplete#custom#option('sources', {
" \ '_': ['ale'],
" \})
" let g:airline_powerline_fonts = 1

" === QuickScope Configuration ===
"
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END


set termguicolors
lua require'colorizer'.setup()

hi Comment cterm=italic

function SwitchTheme(isLight) abort
  if a:isLight
    set background=light
    let g:airline_theme='gruvbox8'
    colorscheme gruvbox8_hard
  else
    set background=dark
    let g:airline_theme='gruvbox8'
    colorscheme gruvbox8
  endif
endfunction

let s:mode = $SYSTEM_COLOR_SCHEME
if s:mode == "light"
  call SwitchTheme(v:true)
elseif s:mode == "dark"
  call SwitchTheme(v:false)
else
  " set theme according based on day/night
  if 6 <= strftime("%H") && strftime("%H") < 24
    call SwitchTheme(v:true)
  else
    call SwitchTheme(v:false)
  endif
endif


" sets F10 as a switch between dark and light modes
map <F10> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>


" === IndentLine ===
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char = '┊'
let g:indentLine_first_char = '┊'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" let g:indent_guides_enable_on_vim_startup = 1

" === NERDTree ===
" Ctrl + b to toggle
map <C-b> :NERDTreeToggle<CR>
let g:leader_map['n'] = [':NERDTreeToggle' , 'NERDTreeToggle']
" let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
let g:NERDTreeStatusline = ''
let g:NERDTreeHighlightCursorline = 0
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter *
"           \   if argc() == 0 && !exists("s:std_in")
"           \ |   Startify
"           \ |   NERDTree
"           \ |   wincmd w
"           \ | elseif argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
"           \ |   Startify
"           \ |   exe 'NERDTree' argv()[0]
"           \ |   wincmd p
"           \ |   exe 'cd '.argv()[0]
"           \ | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" === vim-devicons for NERDTree ===
"
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderPatternMatching = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1

" === NerdCommenter ===
" <leader> cc -> comment out the current line or text selected
" <leader> cn -> Same as cc but forces nesting.
" <leader> c <space> -> toggle the comment state of the selected line(s)
" <leader> cu -> Uncomments the selected line(s).
" let g:leader_map['c'] = {'name': '+NerdCommenter'}
" let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
" let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
" let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDAltDelims_java = 1 " Set a language to use its alternate delimiters by default
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
" let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
" let g:NERDToggleCheckAllLines = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not
" let g:leader_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>

" Buffer management
set autowrite
set autoread
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

set showmatch
set ignorecase
set smartcase
set incsearch
set hidden
set mouse=a
set nocompatible " Set compatibility to Vim only.
filetype off " Helps force plug-ins to load correctly when it is turned back on below.
" * syntax highlighting dissabled was causing bug in theme
" syntax on " Turn on syntax highlighting.
filetype plugin indent on " For plug-ins to load correctly.
set modelines=0 " Turn off modelines
" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
set wrap " Automatically wrap text that extends beyond the screen length.
set linebreak "Avoid wrapping a line in the middle of a word
" set textwidth=79 " Uncomment to set the max textwidth. Use a value corresponding to the width of your screen.
:set colorcolumn=80
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
" indent and retain selection in visual mode
vnoremap > >gv
vnoremap < <gv

set expandtab
set noshiftround
set scrolloff=5 " Display 5 lines above/below the cursor when scrolling with a mouse.
set backspace=indent,eol,start " Fixes common backspace problems
set ttyfast " Speed up scrolling in Vim
set laststatus=2 " Status bar
set cursorline "Highlight the line currently under cursor.
set backupdir=~/.cache/vim " Directory to store backup files.h
set confirm "Display a confirmation dialog when closing an unsaved file.
set updatetime=300

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
" Automatic toggling between line number modes
set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


set encoding=utf-8 " Encoding
set hlsearch " Highlight matching search patterns
set incsearch " Enable incremental search
set ignorecase " Include matching uppercase words with lowercase search term
set smartcase " Include only uppercase words with uppercase search term
set viminfo='100,<9999,s100 " Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.

" Map the <Space> key to toggle a selected fold opened/closed.
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" vnoremap <Space> zf

" move among buffers
map <M-a> :bprevious<CR>
map <M-d> :bnext<CR>


" let g:ale_linters = {'haskell': ['hlint', 'ghc'], 'purescript': ['purty']}
" let g:ale_haskell_ghc_options = '-fno-code -v0 -isrc'
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" Set this. Airline will handle the rest.
" let g:airline#extensions#ale#enabled = 1


" function! LinterStatus() abort
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors
"   return l:counts.total == 0 ? 'OK' : printf(
"     \   '%dW %dE',
"     \   all_non_errors,
"     \   all_errors
"     \)
" endfunction
"
" set statusline=%{LinterStatus()}

" Run HLint
autocmd filetype haskell nm <buffer> <silent> ,h :!hlint %<CR>
autocmd filetype purescript nm <buffer> <silent> ,h :!purty --write %<CR>

" Ghcide
" let g:LanguageClient_rootMarkers = {}
" let g:LanguageClient_rootMarkers.haskell = ['*.cabal', 'stack.yaml']
" let g:LanguageClient_serverCommands = {
"     \ 'haskell': ['haskell-language-server-wrapper', '--lsp'],
"     \ }

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
" let g:haskell_classic_highlighting = 1

let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" vim-markdown
let g:vim_markdown_folding_disabled = 1 " dissable folding
set conceallevel=2 " concealing text For example, conceal [link text](link url) as just link text.

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

" **************** Competitve Coding *****************
"
"
" Template [C++]
autocmd BufNewFile *.cpp -r ~/.templates/template.cpp
"" Compile/Run [C++]
autocmd filetype cpp nm <buffer> gb :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && time g++ -g -std=c++17 -Wall -Wextra -Wno-unused-result -D LOCAL -O2 %:r.cpp -o %:r 2>&1 \| tee %:r.cerr && printf "\n================\n   Running...\n================\n" && time ./%:r < %:r.in > %:r.out 2> %:r.err && printf "\n\n\n\n"<CR>
autocmd filetype cpp nm <buffer> gc :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && time g++ -g -std=c++17 -Wall -Wextra -Wno-unused-result -D LOCAL -O2 %:r.cpp -o %:r 2>&1 \| tee %:r.cerr && printf "\n================\n   Running...\n================\n" && time ./%:r  && printf "\n\n\n\n"<CR>

"GBranches
let g:fzf_branch_actions = {
      \ 'diff': {
      \   'prompt': 'Diff> ',
      \   'execute': 'Git diff {branch}',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-f',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}
let g:git_messenger_include_diff = 'current'
" GitGutter
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterAddLine guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterChangeLine guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
highlight GitGutterDeleteLine guifg=#ff2222 ctermfg=Red
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_map_keys = 0
let g:leader_map['i'] = [':GitGutterFold | GitGutterLineHighlightsToggle', 'highlight and fold']
let g:leader_map['g'] = {
  \ 'name':'+git',
  \ 'a' : [':Git add %'                     , 'add current'                 ] ,
  \ 'A' : [':Git add .'                     , 'add all'                     ] ,
  \ 'b' : [':GBranches'                     , 'Checkout branch'             ] ,
  \ 'B' : [':Git blame'                     , 'blame'                       ] ,
  \ 'c' : [':Git commit'                    , 'commit'                      ] ,
  \ 'C' : [':GBranches create'              , 'Create branch'               ] ,
  \ 'd' : [':Git diff'                      , 'diff'                        ] ,
  \ 'D' : [':Gdiffsplit'                    , 'diff split'                  ] ,
  \ 'f' : [':GBranches diff'                , 'Diff branch'                 ] ,
  \ 'F' : [':GitGutterFold'                 , 'fold unchanged lines'        ] ,
  \ 'g' : [':Git'                           , 'Git '                        ] ,
  \ 'h' : ['<Plug>(GitGutterPreviewHunk)'   , 'preview hunk'                ] ,
  \ 'H' : [':GitGutterLineHighlightsToggle' , 'highlight hunks'             ] ,
  \ 'j' : ['<Plug>(GitGutterNextHunk)'      , 'next hunk'                   ] ,
  \ 'k' : ['<Plug>(GitGutterPrevHunk)'      , 'prev hunk'                   ] ,
  \ 'l' : [':Git log --stat'                , 'logs'                        ] ,
  \ 'L' : [':Git log --stat -p'             , 'logs with changes'           ] ,
  \ 'M' : [':GBranches merge'               , 'Merge branch'                ] ,
  \ 'p' : [':Git pull'                      , 'pull'                        ] ,
  \ 'P' : [':Git push'                      , 'push'                        ] ,
  \ 'r' : [':GBranches rebase'              , 'Rebase with branch'          ] ,
  \ 's' : ['<Plug>(GitGutterStageHunk)'     , 'stage hunk'                  ] ,
  \ 'S' : [ ':GStashList'                   , 'git stash list'              ] ,
  \ 't' : [':Twiggy'                        , 'Twiggy'                      ] ,
  \ 'T' : [':GitGutterSignsToggle'          , 'toggle signs'                ] ,
  \ 'u' : ['<Plug>(GitGutterUndoHunk)'      , 'undo hunk'                   ] ,
  \ 'v' : [ ':GV'                           , 'git tree GV'                 ] ,
  \ 'V' : [ ':GV!'                          , 'git tree GV'                 ] ,
  \ '[' : [':diffget //2 | diffupdate'      , 'hunk from the target parent' ] ,
  \ ']' : [':diffget //3 | diffupdate'      , 'hunk from the merge parent'  ] ,
  \ 'i' : {
    \ 'name' : '+advance',
    \ 'm' : [':Git merge --continue'                                   , 'merge continue'    ] ,
    \ 'r' : [':Git rebase --continue'                                  , 'rebase continue'   ] ,
    \ 'p' : [':Git push --force'                                       , 'push force'        ] ,
    \ 'c' : [':Git commit -m "fast-commit"'                            , 'quick commit'      ] ,
    \ 's' : [':Git rebase -i HEAD~2'                                   , 'squash cur commit' ] ,
    \ 'f' : [':!git checkout -- .'                                     , 'flus changes'      ] ,
    \ 'q' : 'fast squash',
    \ 'n' : 'push upstream new',
    \ 'g' : 'reset branch',
    \ 'j' : 'insert jira ticket no.',
    \ },
  \ }
nmap <leader>giq :call GSquash()<CR>
nmap <leader>gin :exe "Git push --set-upstream origin ". fugitive#head()<CR>
nmap <leader>gig :exe "Git reset --hard origin/". fugitive#head()<CR>
nmap <leader>gij :exe "normal! a" . matchstr(fugitive#head(), 'PICAF-\_[0-9]*'). " "<CR>a
let g:twiggy_group_locals_by_slash = 0
" let g:twiggy_local_branch_sort = 'mru'
let g:twiggy_remote_branch_sort = 'date'

" A more sane configuration
let g:fuzzy_stash_actions = {
  \ 'ctrl-d': 'drop',
  \ 'ctrl-p': 'pop',
  \ 'ctrl-w': 'apply' }

function GSquash() abort
  exec ':Git commit -m "fast-commit"'
  exec ':Git rebase -i HEAD~2'
  exec '/fast-commit'
  exec ':s/pick/squash/g'
  exec ':wq'
  function CommentMessage() abort
    exec '/fast-commit'
    exec ':Commentary'
    exec ':wq'
  endfunction
  call timer_start(200, { tid -> execute('call CommentMessage()')})
endfunction

" === File management ===
" Ranger && Denite
let g:ranger_map_keys = 0
nnoremap <leader>fs :Find<SPace>
nnoremap <leader>fj :exe "Find ". expand('<cword>') <CR>
nnoremap <leader>fS :FindAll<SPace>
nnoremap <leader>fJ :exe "FindAll ". expand('<cword>') <CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:leader_map['o'] = [':Buffers' , 'Open buffers']
let g:leader_map['j'] = [':BLines'  , 'Find in current buffer']
let g:leader_map['r'] = [':Ranger'  , 'Ranger']
let g:leader_map['f'] = {
  \ 'name' : '+file',
  \ 'c' : [':Commits'   , 'commits'            ] ,
  \ 'C' : [':BCommits'  , 'buffer commits'     ] ,
  \ 'f' : [':GFiles'    , 'git files'          ] ,
  \ 'F' : [':Files'     , 'files'              ] ,
  \ 'g' : [':GFiles?'   , 'modified git files' ] ,
  \ 'h' : [':History'   , 'file history'       ] ,
  \ 'H' : [':History:'  , 'command history'    ] ,
  \ 'l' : [':Lines'     , 'lines'              ] ,
  \ 'm' : [':Marks'     , 'marks'              ] ,
  \ 'M' : [':Maps'      , 'normal maps'        ] ,
  \ 'p' : [':Helptags'  , 'help tags'          ] ,
  \ 'P' : [':Tags'      , 'project tags'       ] ,
  \ 'y' : [':Filetypes' , 'file types'         ] ,
  \ 'z' : [':FZF'       , 'FZF'                ] ,
  \ 's' : 'Search term occurences in cwd',
  \ 'j' : 'Search term under cursor in cwd',
  \ }
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* FindAll call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --no-ignore --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
""" Uncomment following if you want to see search result in floating window
" let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let g:fzf_layout = { 'down': '~80%' }

if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

" --------------- Latex specific configuration ----------------------
"
autocmd FileType tex,latex noremap <leader>d :w<CR>:!texify<Space>-cp<Space>%<CR>
autocmd FileType tex,latex inoremap ,c \{<++>}<CR><++><Esc>?{<CR>i
autocmd FileType tex,latex inoremap ,dc \documentclass{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,up \usepackage{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,bd \begin{document}<CR><CR><CR><CR>\end{document}<Esc>kki
autocmd FileType tex,latex inoremap ,be \begin{}<CR><CR><CR><CR>\end{<++>}<Esc>?n{<CR>lli
autocmd FileType tex,latex inoremap ,ti \title{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,a \author{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,mt \maketitle<CR><CR>
autocmd FileType tex,latex inoremap ,s \section{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,ss \subsection{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,sss \subsubsection{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,rc \renewcommand{}{<++>}<CR><CR><++><Esc>?}{<CR>i
autocmd FileType tex,latex inoremap ,tf \titleformat{}{<++>}{<++>}{<++>}{<++>}<CR><CR><++><Esc>?{}<CR>li
autocmd FileType tex,latex inoremap ,lt {\LaTeX}<Space>
autocmd FileType tex,latex inoremap ,b \bfseries
autocmd FileType tex,latex inoremap ,t \tiny
autocmd FileType tex,latex inoremap ,sc \scriptsize
autocmd FileType tex,latex inoremap ,fn \footnotesize
autocmd FileType tex,latex inoremap ,sm \small
autocmd FileType tex,latex inoremap ,l \large
autocmd FileType tex,latex inoremap ,h \huge


" --------------- Purescript specific configuration ----------------------
" for 'frigoeu/psc-ide-vim' commented because it was consuming too much
" resources
" let g:psc_ide_syntastic_mode = 1
" " List loaded modules.
" autocmd filetype purescript nm <buffer> <silent> ,L :Plist<CR>
" " Load externs, with optional |<bang>|, first reset loaded modules.
" autocmd filetype purescript nm <buffer> <silent> ,l :Pload!<CR>
" " Rebuild current buffer, with optional |<bang>| first reload the modules.
" autocmd filetype purescript nm <buffer> <silent> ,r :Prebuild!<CR>
" " Generate function template from a function signature on the current line.
" autocmd filetype purescript nm <buffer> <silent> ,f :PaddClause<CR>
" " Add type annotation to a function on the current line, e.g. if you use this command over the line
" autocmd filetype purescript nm <buffer> <silent> ,T :PaddType<CR>
" " Apply current line suggestion if there is any.
" autocmd filetype purescript nm <buffer> <silent> ,a :Papply<CR>
" "   With |<bang>| applies all suggestions.  Warning that have suggestion are indicated with 'V' in the quick fix list.
" autocmd filetype purescript nm <buffer> <silent> ,A :Papply!<CR>
" " Add case expression for give type, with optional |<bang>| it will also include type annotations, e.g. starting with
" autocmd filetype purescript nm <buffer> <silent> ,C :Pcase!<CR>
" " import the word under cursor
" autocmd filetype purescript nm <buffer> <silent> ,i :Pimport<CR>
" " qualified import
" autocmd filetype purescript nm <buffer> <silent> ,q :PaddImportQualifications<CR>
" " Goto identifier
" autocmd filetype purescript nm <buffer> <silent> ,g :Pgoto<CR>
" " Search pursuit for the word under the cursor
" autocmd filetype purescript nm <buffer> <silent> ,p :Pursuit<CR>
" " Find type of the word under the cursor
" autocmd filetype purescript nm <buffer> <silent> ,t :Ptype<CR>
"

" let g:vimmerps_disable_mappings = v:true
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nm <localleader>t :call LanguageClient#textDocument_hover()<CR>
" nm <localleader>g :call LanguageClient#textDocument_definition()<CR>
" nm <localleader>r :call LanguageClient#textDocument_rename()<CR>
" nm <localleader>f :call LanguageClient#textDocument_formatting()<CR>
" nm <localleader>b :call LanguageClient#textDocument_references()<CR>
" nm <localleader>a :call LanguageClient#textDocument_codeAction()<CR>
" nm <localleader>s :call LanguageClient#textDocument_documentSymbol()<CR>
" autocmd Filetype purescript nm <buffer> <silent> <localleader>a :Papply<CR>
" autocmd Filetype purescript nm <buffer> <silent> <localleader>i :Pimport<CR>
" autocmd Filetype purescript nm <buffer> <silent> <localleader>l :Pbuild<CR>
"
" === vim-codefmt CodeFormater ===
" augroup autoformat_settings
"   autocmd FileType bzl AutoFormatBuffer buildifier
"   autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
"   autocmd FileType javascript AutoFormatBuffer prettier
"   autocmd FileType dart AutoFormatBuffer dartfmt
"   autocmd FileType go AutoFormatBuffer gofmt
"   autocmd FileType gn AutoFormatBuffer gn
"   autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
"   autocmd FileType java AutoFormatBuffer google-java-format
"   autocmd FileType python AutoFormatBuffer yapf
"   autocmd FileType rust AutoFormatBuffer rustfmt
"   autocmd FileType vue AutoFormatBuffer prettier
"   " autocmd FileType purescript AutoFormatBuffer purty
" augroup END
"

" === Quick Edit ===
"
let g:leader_map['e'] = {'name':'+quickOpen'}
nmap <leader>en :edit $HOME/.nvimrc <CR>
nmap <leader>ep :edit $HOME/.nvimrc.plug <CR>
nmap <leader>ez :edit $HOME/.zshrc <CR>

nmap <leader>ur :%s/<C-r><C-w>//g<Left><Left>
" === Utilities ===
"
nmap <leader>uT i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
let g:leader_map['u'] = {'name':'+Utilities',
  \ 't' : [':UndotreeToggle',   'UndotreeToggle'],
  \ 'T' : 'Add timeStamp',
  \ }
" Source Vim configuration file and install plugins
nnoremap <silent><leader>ui :source ~/.nvimrc.plug \| :PlugInstall<CR>

" === Session management ===
"
let g:sessions_dir = '~/vim-sessions'
function LoadSessionHash()
  let s:sessionFile = system('pwd | md5sum | cut -f1 -d" " | xargs -I{} echo {}".vim"')
  exec ':source ' . g:sessions_dir . '/' . s:sessionFile
endfunction
nmap <Leader>sq :call LoadSessionHash()<CR>

function SaveSessionHash()
  let s:sessionFile = system('pwd | md5sum | cut -f1 -d" " | xargs -I{} echo {}".vim"')
  exec ':Obsession ' . g:sessions_dir . '/' . s:sessionFile
endfunction
nmap <Leader>sh :call SaveSessionHash()<CR>

let g:leader_map['s'] = {'name':'+Session',
  \ 's' : 'Save Session',
  \ 'l' : 'Load Session',
  \ 't' : 'Toggle Session' }
exec 'nnoremap <Leader>ss :Obsession ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sl :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'
nnoremap <Leader>st :Obsession<CR>
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = "{ॐ}"

" let g:remembers_tmp_dir = '~/.cache/vim/remembers'
" let g:remembers_session_dir = g:sessions_dir
" let g:remembers_ignore_empty_buffers = 1

" === Stratify settings ===
let g:startify_change_to_dir = 0
let g:startify_lists = [
          \ { 'type': 'sessions'  , 'header': ['   Sessions'                     ] } ,
          \ { 'type': 'files'     , 'header': ['   Files'                        ] } ,
          \ { 'type': 'dir'       , 'header': ['   Current Directory '. getcwd() ] } ,
          \ { 'type': 'bookmarks' , 'header': ['   Bookmarks'                    ] } ,
          \ ]
let g:startify_change_to_vcs_root = 1
let g:startify_session_dir = g:sessions_dir
let g:startify_session_before_save = [
  \ 'echo "Cleaning up before saving.."',
  \ 'silent! NERDTreeTabsClose'
  \ ]
let g:startify_session_sort = 1

augroup HoogleMaps
  autocmd!
  autocmd FileType haskell nnoremap <buffer> <localleader>hh :Hoogle <C-r><C-w><CR>
augroup END

let g:carbon_now_sh_options =
\ { 'ln': 'true',
  \ 'fm': 'Source Code Pro' }

" ----------------------------------------------------------------------------
" tmux
" ----------------------------------------------------------------------------
function! s:tmux_send(content, dest) range
  let dest = empty(a:dest) ? input('To which pane? ') : a:dest
  let tempfile = tempname()
  call writefile(split(a:content, "\n", 1), tempfile, 'b')
  call system(printf('tmux load-buffer -b vim-tmux %s \; paste-buffer -d -b vim-tmux -t %s',
        \ shellescape(tempfile), shellescape(dest)))
  call delete(tempfile)
endfunction

function! s:tmux_map(key, dest)
  execute printf('nnoremap <silent> %s "tyy:call <SID>tmux_send(@t, "%s")<cr>', a:key, a:dest)
  execute printf('xnoremap <silent> %s "ty:call <SID>tmux_send(@t, "%s")<cr>gv', a:key, a:dest)
endfunction

call s:tmux_map('<leader>tt', '')
call s:tmux_map('<leader>th', '.left')
call s:tmux_map('<leader>tj', '.bottom')
call s:tmux_map('<leader>tk', '.top')
call s:tmux_map('<leader>tl', '.right')
call s:tmux_map('<leader>ty', '.top-left')
call s:tmux_map('<leader>to', '.top-right')
call s:tmux_map('<leader>tn', '.bottom-left')
call s:tmux_map('<leader>t.', '.bottom-right')
let g:leader_map['t'] = { 'name' : '+tmux+coc'}


vnoremap <leader>p "_dP

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Give more space for displaying messages.
set cmdheight=2
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <M-space> to trigger completion.
inoremap <silent><expr> <M-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <localleader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <localleader>] <Plug>(coc-diagnostic-next)
" Mappings for CoCList, Show all diagnostics.
nnoremap <silent><nowait> <localleader>cd  :<C-u>CocList diagnostics<cr>

" GoTo code navigation.
nmap <silent> <localleader>g <Plug>(coc-definition)
nmap <silent> <localleader>d <Plug>(coc-type-definition)
nmap <silent> <localleader>i <Plug>(coc-implementation)
nmap <silent> <localleader>r <Plug>(coc-references)
" Symbol renaming.
nmap <localleader>r <Plug>(coc-rename)
" Formatting selected code.
xmap <localleader>f  <Plug>(coc-format-selected)
nmap <localleader>f  <Plug>(coc-format-selected)
" show definition in preview window (works with COC)
nmap <silent> <localleader>v :SkylightPreview<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Use K to show documentation in preview window.
nnoremap <silent> <localleader>t :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <localleader>aa  <Plug>(coc-codeaction-selected)
nmap <localleader>aa  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <localleader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <localleader>af  <Plug>(coc-fix-current)

" Manage extensions.
nnoremap <silent><nowait> <localleader>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <localleader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <localleader>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <localleader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <localleader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <localleader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <localleader>cp  :<C-u>CocListResume<CR>

nnoremap <silent> <leader>tt :<C-u>CocList todolist<CR>
nnoremap <silent> <leader>tc :<C-u>CocCommand todolist.create<CR>
nnoremap <silent> <leader>te :<C-u>CocCommand todolist.export<CR>
nnoremap <silent> <leader>tq :<C-u>CocCommand todolist.closeNotice<CR>
nnoremap <silent> <leader>tQ :<C-u>CocCommand todolist.clear<CR>

nmap <silent> <leader>c :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" alok/notational-fzf-vim
let g:nv_search_paths = ['~/notes' ,'~/wiki', '~/writing', '~/code', 'docs.md' , './notes.md']
nnoremap <silent> <leader>ee :NV<CR>
let g:nv_default_extension = '.md'
let g:nv_create_note_key = 'ctrl-x'


let g:leader_map['a'] = {'name' : '+align'}
if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  vmap <leader>a: :Tabularize /:\zs<CR>
  nmap <leader>aa :Tabularize /
  vmap <leader>aa :Tabularize /
endif

" blamer.nvim
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
" let g:blamer_prefix = ' | '
"

" edit macro using  "q<leader>m
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
let g:leader_map['m'] = 'edit reg'

" ================ CloseTag ==========================

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,typescript'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1
