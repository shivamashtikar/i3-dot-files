let mapleader=";"
let maplocalleader = ","

" Leader key to trigger vim-which-key
" pass leader key to WhichKey
call which_key#register(';', "g:leader_map")
nnoremap <silent> <leader> :WhichKey ';'<CR>

call which_key#register(',', "g:localleader_map")
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
set timeoutlen=500
let g:leader_map = {}
let g:localleader_map = {}

" Use system Clipboard
set clipboard+=unnamedplus

" Trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Enable spell checking, s for spell check
map <leader>s :setlocal spell! spelllang=en_us<CR>
let g:leader_map['s'] = 'toggle spell checking'

" Shortcut for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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
nnoremap <leader><S-q> :q<CR>
let g:leader_map['Q'] = 'Quit Window'
nnoremap <leader>q :Bclose<CR>
let g:leader_map['q'] = 'Quit buffer'
nnoremap <leader>w :w<CR>
let g:leader_map['w'] = 'Write buffer'


" Shift + u for redo
noremap <S-u> <C-r>

" === Deoplete ===
" Use deoplete at startup
let g:deoplete#enable_at_startup = 1
" deoplete-clang
" # On GNU/Linux
" $ sudo find / -name libclang.so
" # On macOS
" $ mdfind -name libclang.dylib
let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang'
" call deoplete#custom#option('sources', {
" \ '_': ['ale'],
" \})
let g:airline_powerline_fonts = 1

" ColorSchemes
" colorscheme fahrenheit
" colorscheme orbital
" colorscheme gotham
" let g:gotham_airline_emphasised_insert = 0
" colorscheme murphy
" Ayu
" let ayucolor="light"  " for light version of theme
" set theme according based on day/night
if 6 <= strftime("%H") && strftime("%H") < 19
  " set background=light
  set background=dark
  colorscheme PaperColor
  let g:airline_theme='papercolor'
else
"   let ayucolor="mirage"   " for dark version of theme
"   let g:airline_theme='ayu_dark'
"   colorscheme ayu
"   set termguicolors
  " set background=light
  set background=dark
  colorscheme PaperColor
  let g:airline_theme='papercolor'

endif

" === IndentLine ===
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char = '┊'
let g:indentLine_first_char = '┊'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

" === Stratify settings ===
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 0

" === NERDTree ===
" Ctrl + b to toggle
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
let g:NERDTreeStatusline = ''
let g:NERDTreeHighlightCursorline = 0
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter *
         \   if argc() == 0 && !exists("s:std_in")
         \ |   Startify
         \ |   NERDTree
         \ |   wincmd w
         \ | elseif argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
         \ |   Startify
         \ |   exe 'NERDTree' argv()[0]
         \ |   wincmd p
         \ |   exe 'cd '.argv()[0]
         \ | endif
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
let g:leader_map['c'] = {'name': '+NerdCommenter'}
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1 " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not


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
set updatetime=250

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
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" move among buffers with CTRL
map <C-n> :bnext<CR>
map <C-p> :bprevious<CR>


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
let g:LanguageClient_rootMarkers = {}
let g:LanguageClient_rootMarkers.haskell = ['*.cabal', 'stack.yaml']
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['ghcide', '--lsp'],
    \ }
"Call language server
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" vim-markdown
let g:vim_markdown_folding_disabled = 1 " dissable folding
set conceallevel=2 " concealing text For example, conceal [link text](link url) as just link text.

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

" **************** Competitve Coding *****************
"
"
" Template [C++]
autocmd BufNewFile *.cpp -r ~/.templates/template.cpp
"" Compile/Run [C++]
autocmd filetype cpp nm <buffer> gb :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && time g++ -g -std=c++17 -Wall -Wextra -Wno-unused-result -D LOCAL -O2 %:r.cpp -o %:r 2>&1 \| tee %:r.cerr && printf "\n================\n   Running...\n================\n" && time ./%:r < %:r.in > %:r.out 2> %:r.err && printf "\n\n\n\n"<CR>
autocmd filetype cpp nm <buffer> gc :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && time g++ -g -std=c++17 -Wall -Wextra -Wno-unused-result -D LOCAL -O2 %:r.cpp -o %:r 2>&1 \| tee %:r.cerr && printf "\n================\n   Running...\n================\n" && time ./%:r  && printf "\n\n\n\n"<CR>


" GitGutter
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_map_keys = 0
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>ghl :GitGutterLineHighlightsToggle<CR>
nmap <leader>ghf :GitGutterFold<CR>
nmap <leader>ga :Git add %
nmap <leader>gc :Git commit<CR>
nmap <leader>gr :Git rebase -i
nmap <leader>gb :Git blame<CR>
nmap <leader>gm :Git mergetool<CR>
nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>gg :Git<CR>
nmap <leader>ga :Git add %<CR>
let g:leader_map['g'] = {
  \ 'name':'+git',
  \ 'h' : { 'name' : '+highlight' }
  \ }

" === File management ===
" Ranger && Denite
let g:ranger_map_keys = 0
nnoremap <leader>fr :Ranger<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fs :Find<SPace>
nnoremap <leader>fj :exe "Find ". expand('<cword>') <CR>
nnoremap <leader>ft :Colors<CR>
nnoremap <leader>fg :GFiles<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:leader_map['f'] = {
  \ 'name' : '+file',
  \ 'r' : 'Open Ranger',
  \ 'b' : 'View buffers',
  \ 'f' : 'Browse files in cwd',
  \ 's' : 'Search term occurences in cwd',
  \ 'j' : 'Search term under cursor in cwd'
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
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

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

let g:vimmerps_disable_mappings = v:true
autocmd Filetype purescript nm <buffer> <silent> <localleader>a :Papply<CR>
autocmd Filetype purescript nm <buffer> <silent> <localleader>i :Pimport<CR>
autocmd Filetype purescript nm <buffer> <silent> <localleader>g :call LanguageClient_textDocument_definition()<CR>
autocmd Filetype purescript nm <buffer> <silent> <localleader>t :call LanguageClient_textDocument_hover()<CR>
autocmd Filetype purescript nm <buffer> <silent> <localleader>l :Pbuild<CR>

"
" === vim-codefmt CodeFormater ===
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
  autocmd FileType javascript AutoFormatBuffer prettier
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
  " autocmd FileType purescript AutoFormatBuffer purty
augroup END


" === Quick Edit ===
"
let g:leader_map['e'] = {'name':'+quickOpen'}
nmap <leader>en :edit $HOME/.nvimrc <CR>
nmap <leader>ez :edit $HOME/.zshrc <CR>
