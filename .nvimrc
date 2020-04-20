let mapleader=";"

" Use system Clipboard
set clipboard+=unnamedplus

" Trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Enable spell checking, s for spell check
map <leader>s :setlocal spell! spelllang=en_us<CR>

" Shortcut for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcut split opening
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

" Autocompletion commands
set wildmode=longest,list,full

" Clear the search with ,/
nmap <silent> ,/ :nohlsearch<CR>

" Alias write and quit to Q
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" Fix splitting
set splitbelow splitright

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

let g:airline_theme='ayu_dark'
let g:airline_powerline_fonts = 1

" ColorSchemes
" colorscheme fahrenheit
" colorscheme orbital
" colorscheme gotham
" let g:gotham_airline_emphasised_insert = 0
" colorscheme murphy
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
set termguicolors

" === IndentLine ===
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char = '┊'
let g:indentLine_first_char = '┊'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

" === NERDTree ===
" Ctrl + b to toggle
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
let g:NERDTreeStatusline = ''
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
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_enable_denite = 1
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
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1 " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not


set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
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

" Run HLint
autocmd filetype haskell nm <buffer> <silent> ,h :!hlint %<CR>

" Ghcide
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['ghcide', '--lsp'],
    \ }
"Call language server
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

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
  nmap ]h <Plug>(GitGutterNextHunk)
  nmap [h <Plug>(GitGutterPrevHunk)
  nmap <Leader>hu <Plug>(GitGutterUndoHunk)

  " === Denite setup ==="
  " Use ripgrep for searching current directory for files
  " By default, ripgrep will respect rules in .gitignore
  "   --files: Print each file that would be searched (but don't search)
  "   --glob:  Include or exclues files for searching that match the given glob
  "            (aka ignore .git files)
  "
  " Define mappings
  try

  call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

  " Use ripgrep in place of "grep"
  call denite#custom#var('grep', 'command', ['rg'])

  " Custom options for ripgrep
  "   --vimgrep:  Show results with every match on it's own line
  "   --hidden:   Search hidden directories and files
  "   --heading:  Show the file name above clusters of matches from each file
  "   --S:        Search case insensitively if the pattern is all lowercase
  call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

  " Recommended defaults for ripgrep via Denite docs
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])

  " Remove date from buffer list
  call denite#custom#var('buffer', 'date_format', '')

  " Custom options for Denite
  "   auto_resize             - Auto resize the Denite window height automatically.
  "   prompt                  - Customize denite prompt
  "   direction               - Specify Denite window direction as directly below current pane
  "   winminheight            - Specify min height for Denite window
  "   highlight_mode_insert   - Specify h1-CursorLine in insert mode
  "   prompt_highlight        - Specify color of prompt
  "   highlight_matched_char  - Matched characters highlight
  "   highlight_matched_range - matched range highlight
  let s:denite_options = {'default' : {
  " \ 'split': 'floating',
  \ 'start_filter': 1,
  \ 'auto_resize': 1,
  \ 'source_names': 'short',
  \ 'prompt': 'λ ',
  \ 'highlight_matched_char': 'QuickFixLine',
  \ 'highlight_matched_range': 'Visual',
  \ 'highlight_window_background': 'Visual',
  \ 'highlight_filter_background': 'DiffAdd',
  \ 'winrow': 1,
  \ 'vertical_preview': 1
  \ }}

  " Loop through denite options and enable them
  function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
  endfunction

  call s:profile(s:denite_options)
  catch
  echo 'Denite not installed. It should work after running :PlugInstall'
  endtry

  " === Denite shorcuts === "
  "   C-o         - Browser currently open buffers
  "   C-p - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
noremap <C-o> :Denite buffer<CR>
nmap <C-p> :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-i>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-i>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction


" --------------- Latex specific configuration ----------------------
"
" autocmd FileType tex,latex noremap <leader>d :w<CR>:!texify<Space>-cp<Space>%<CR>
" autocmd FileType tex,latex inoremap ,c \{<++>}<CR><++><Esc>?{<CR>i
" autocmd FileType tex,latex inoremap ,dc \documentclass{}<CR><CR><++><Esc>?}<CR>i
" autocmd FileType tex,latex inoremap ,up \usepackage{}<CR><CR><++><Esc>?}<CR>i
" autocmd FileType tex,latex inoremap ,bd \begin{document}<CR><CR><CR><CR>\end{document}<Esc>kki
" autocmd FileType tex,latex inoremap ,be \begin{}<CR><CR><CR><CR>\end{<++>}<Esc>?n{<CR>lli
" autocmd FileType tex,latex inoremap ,ti \title{}<CR><CR><++><Esc>?}<CR>i
" autocmd FileType tex,latex inoremap ,a \author{}<CR><CR><++><Esc>?}<CR>i
" autocmd FileType tex,latex inoremap ,mt \maketitle<CR><CR>
" autocmd FileType tex,latex inoremap ,s \section{}<CR><CR><++><Esc>?}<CR>i
" autocmd FileType tex,latex inoremap ,ss \subsection{}<CR><CR><++><Esc>?}<CR>i
" autocmd FileType tex,latex inoremap ,sss \subsubsection{}<CR><CR><++><Esc>?}<CR>i
" autocmd FileType tex,latex inoremap ,rc \renewcommand{}{<++>}<CR><CR><++><Esc>?}{<CR>i
" autocmd FileType tex,latex inoremap ,tf \titleformat{}{<++>}{<++>}{<++>}{<++>}<CR><CR><++><Esc>?{}<CR>li
" autocmd FileType tex,latex inoremap ,lt {\LaTeX}<Space>
" autocmd FileType tex,latex inoremap ,b \bfseries
" autocmd FileType tex,latex inoremap ,t \tiny
" autocmd FileType tex,latex inoremap ,sc \scriptsize
" autocmd FileType tex,latex inoremap ,fn \footnotesize
" autocmd FileType tex,latex inoremap ,sm \small
" autocmd FileType tex,latex inoremap ,l \large
" autocmd FileType tex,latex inoremap ,h \huge


" --------------- Purescript specific configuration ----------------------
"
let g:psc_ide_syntastic_mode = 1
" List loaded modules.
autocmd filetype purescript nm <buffer> <silent> ,L :Plist<CR>
" Load externs, with optional |<bang>|, first reset loaded modules.
autocmd filetype purescript nm <buffer> <silent> ,l :Pload!<CR>
" Rebuild current buffer, with optional |<bang>| first reload the modules.
autocmd filetype purescript nm <buffer> <silent> ,r :Prebuild!<CR>
" Generate function template from a function signature on the current line.
autocmd filetype purescript nm <buffer> <silent> ,f :PaddClause<CR>
" Add type annotation to a function on the current line, e.g. if you use this command over the line
autocmd filetype purescript nm <buffer> <silent> ,t :PaddType<CR>
" Apply current line suggestion if there is any.
autocmd filetype purescript nm <buffer> <silent> ,a :Papply<CR>
"   With |<bang>| applies all suggestions.  Warning that have suggestion are indicated with 'V' in the quick fix list.
autocmd filetype purescript nm <buffer> <silent> ,A :Papply!<CR>
" Add case expression for give type, with optional |<bang>| it will also include type annotations, e.g. starting with
autocmd filetype purescript nm <buffer> <silent> ,C :Pcase!<CR>
" import the word under cursor
autocmd filetype purescript nm <buffer> <silent> ,i :Pimport<CR>
" qualified import
autocmd filetype purescript nm <buffer> <silent> ,qa :PaddImportQualifications<CR>
" Goto identifier
autocmd filetype purescript nm <buffer> <silent> ,g :Pgoto<CR>
" Search pursuit for the word under the cursor
autocmd filetype purescript nm <buffer> <silent> ,p :Pursuit<CR>
" Find type of the word under the cursor
autocmd filetype purescript nm <buffer> <silent> ,T :Ptype<CR>


" === vim-codefmt CodeFormater ===
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

