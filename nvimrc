let mapleader=" "
let maplocalleader = ","

" ======== vim-which-key ========
" leader key to trigger vim-which-key
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

" Change the colors if you want
" highlight default link WhichKey          Operator
" highlight default link WhichKeySeperator DiffAdded
" highlight default link WhichKeyGroup     Identifier
" highlight default link WhichKeyDesc      Function


" ======== colors ========
set termguicolors
lua require'colorizer'.setup()

hi Comment cterm=italic

function SwitchTheme(isLight) abort
  if a:isLight
    set background=light
    let g:airline_theme='gruvbox8'
    colorscheme gruvbox8_hard
  else
    let g:airline_theme='molokai'
    colorscheme monokai
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


" ======== movement ========
"
" Use alt + hjkl split navigation
map <M-h> <C-w>h
map <M-j> <C-w>j
map <M-k> <C-w>k
map <M-l> <C-w>l

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" ======== resize ========
" Shortcut ctrl + hjkl for to resize windows
nnoremap <C-j> : resize -2<CR>
nnoremap <C-k> : resize +2<CR>
nnoremap <C-h> : vertical resize -2<CR>
nnoremap <C-l> : vertical resize +2<CR>
let g:leader_map['-'] = [':MaximizerToggle', 'MaximizerToggle']
nnoremap <leader>= :wincmd =<cr>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" ======== splits ======== 
" Shortcut split opening
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>
let g:leader_map['h'] = 'Horizontal split'
let g:leader_map['v'] = 'Vertical slit'

" Fix splitting
set splitbelow splitright

" ======== quit ======== 
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

" ======== setters ========
" Use system Clipboard
set clipboard+=unnamedplus
" Path current directory and sub folders
set path+=**
" Buffer management
set autowrite
set autoread
" Triger `autoread` when files changes on disk
" Ref https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044 https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
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
filetype plugin indent on " For plug-ins to load correctly.
set modelines=0 " Turn off modelines
set linebreak "Avoid wrapping a line in the middle of a word
set colorcolumn=80
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
set updatetime=300
set showmode " Display options
set showcmd
" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
set list " Display different types of white spaces.
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
" Show line numbers, Automatic toggling between line number modes
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


" ======== code ======== 
" indent and retain selection in visual mode
vnoremap > >gv
vnoremap < <gv
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>

let g:carbon_now_sh_options =
  \ { 'ln': 'true'
  \ , 'fm': 'Source Code Pro'
  \ }


" ======== utilities ========
nmap <leader>ur :%s/<C-r><C-w>//g<Left><Left>
vmap <leader>ur "hy:%s/<C-r>h//gc<left><left><left>
nmap <leader>ud i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
nnoremap <leader>um  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
" Source Vim configuration file and install plugins
nnoremap <silent><leader>ui :source ~/.nvimrc.plug \| :PlugInstall<CR>
nmap <leader><Tab> :edit # <CR>


" ======== haskell ======== 
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
" let g:haskell_classic_highlighting = 1
"
augroup HoogleMaps
  autocmd!
  autocmd FileType haskell nnoremap <buffer> <localleader>hh :Hoogle <C-r><C-w><CR>
augroup END

" ======== session ========
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

" ======== airline ======== 
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = "{ॐ}"
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline_section_z = ''

" ======== startify ======== 
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

" ======== tmux ========
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

" ======== coc ======== 
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
nmap <silent> <localleader>p <Plug>(coc-diagnostic-prev)
nmap <silent> <localleader>n <Plug>(coc-diagnostic-next)
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

nmap <silent> <leader><space> :CocCommand explorer --width 50<CR>
map <C-b> :CocCommand explorer --width 50<CR>

autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" ======== git ========
" $ blamer.nvim
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
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
" let g:blamer_prefix = ' | '

" $ conflict-marker.vim
" disable the default highlight group
let g:conflict_marker_highlight_group = ''
" Include text after begin and end markers
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'
" highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
map gK :ConflictMarkerPrevHunk<CR>
map gJ :ConflictMarkerNextHunk<CR>

highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterAddLine guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterChangeLine guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
highlight GitGutterDeleteLine guifg=#ff2222 ctermfg=Red
map gk :GitGutterPrevHunk<CR>
map gj :GitGutterNextHunk<CR>

nmap <leader>giq :call GSquash()<CR>
nmap <leader>gin :exe "Git push --set-upstream origin ". fugitive#head()<CR>
nmap <leader>gig :exe "Git reset --hard origin/". fugitive#head()<CR>
nmap <leader>gij :exe "normal! a" . matchstr(fugitive#head(), 'PICAF-\_[0-9]*'). " "<CR>a

function GSquash() abort
  exec ':Git commit -m "fastcommit"'
  exec ':Git rebase -i HEAD~2'
  exec '/fast-commit'
  exec ':s/pick/squash/g'
  exec ':wq'
  function CommentMessage() abort
    exec '/fastcommit'
    exec ':Commentary'
    exec ':wq'
  endfunction
  call timer_start(300, { tid -> execute('call CommentMessage()')})
endfunction
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

" ======== file ======== 
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


" ======== notes ======== 
let g:scratch_persistence_file = '~/Documents/Notes.todo.md'

let g:leader_map['e'] = {'name':'+quickOpen'}
nmap <leader>en :edit $HOME/.nvimrc <CR>
nmap <leader>ep :edit $HOME/.nvimrc.plug <CR>
nmap <leader>ez :edit $HOME/.zshrc <CR>
