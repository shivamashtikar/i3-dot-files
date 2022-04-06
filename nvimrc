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

" ======== colors ========
set termguicolors
lua require'colorizer'.setup()

hi Comment cterm=italic

function SwitchTheme(isLight) abort
  " let g:airline_theme='one'
  colorscheme one
  if a:isLight
    set background=light " for the light version
  else
    set background=dark " for the dark version
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
map <F10> :let &background = &background == "dark" ? "light" : "dark"<CR>



" ======== movement ========
"
" Use alt + hjkl split navigation
map <M-h> <C-w>h
map <M-j> <C-w>j
map <M-k> <C-w>k
map <M-l> <C-w>l

nnoremap <C-f> J
nnoremap J <c-d>zz
nnoremap K <c-u>zz

nnoremap ; :
nnoremap : ;

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

nnoremap <leader>w :up<CR>
let g:leader_map['w'] = 'Write buffer if something is changed'

let g:leader_map['b']={ 'name' : '+buffer' }
nnoremap <silent> <Leader>bb :b <C-d>
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


let g:webdevicons_enable = 1
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

" ======= nvim-telescope.nvim =======
lua require("telescope-config")
" ======= treesitter
lua require("treesitter-config")
" ================= neovim LSP =======================
lua require('lsp-config')
lua require('init')

nnoremap <leader><space> :NvimTreeToggle<CR>

" ======== utilities ========
" #TODO : make plugin for global replace
" :cfdo %s/Sam/Bob/gc | update
"
" Shift + u for redo
noremap <S-u> <C-r>

nnoremap <leader>ur :%s/<C-r><C-w>//g<Left><Left>
vnoremap <leader>ur "hy:%s/<C-r>h//gc<left><left><left>
nnoremap <leader>ud i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
nnoremap <leader>um  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
" Source Vim configuration file and install plugins
nnoremap <silent><leader>ui :source ~/.nvimrc.plug \| :PlugInstall<CR>
nnoremap <leader><TAB> :b#<CR>
nnoremap <leader>ua :argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>

let g:leader_map['u'] = {
  \ 'name':'+git'                       ,
  \ 'a': 'Open file with partern'                 ,
  \ 'c': [':Colors'      , 'ColorScheme'     ] ,
  \ 'd': 'Insert date time'             ,
  \ 'f' : [':Filetypes'        , 'file types'      ] ,
  \ 'h' : [':Telescope command_history' , 'Command history' ] ,
  \ 'm': 'Modify registers'             ,
  \ 'r': 'Replace word'                 ,
  \ 'u' : [':Commands'        , 'Commands'        ] ,
  \ 'b' : [':let &background =  &background == "dark" ? "light" : "dark" ', 'Background color toggle']
  \}
nnoremap Y y$

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-k> <esc>:m .-2<CR>==i
inoremap <C-j> <esc>:m .+1<CR>==i
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

nnoremap <leader>` ysiw`

" Wrap selection with '' 
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
" Wrap selection with ""
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
" Wrap selection with ()
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>) <esc>`>a)<esc>`<i(<esc>
" Wrap selection with []
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>] <esc>`>a]<esc>`<i[<esc>
" Wrap selection with {}
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>}
vnoremap <leader>} <esc>`>a}<esc>`<i{<esc>}

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
" let g:sessions_dir = '.'
" function LoadSessionHash()
"   let s:sessionFile = system('pwd | md5sum | cut -f1 -d" " | xargs -I{} echo {}".vim"')
"   exec ':source ' . g:sessions_dir . '/' . s:sessionFile
" endfunction
" nnoremap <Leader>sq :call LoadSessionHash()<CR>

function SaveSessionHash()
  exec ':Obsession ' . getcwd() . '/' . 'Session.vim'
endfunction
nnoremap <Leader>ss :call SaveSessionHash()<CR>

let g:leader_map['s'] = {'name':'+Session',
  \ 's' : 'Save Session',
  \ 't' : 'Toggle Session' }
" exec 'nnoremap <Leader>ss :Obsession ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
" exec 'nnoremap <Leader>sl :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'
nnoremap <Leader>st :Obsession<CR>

" ======== airline ======== 
" let g:airline#extensions#obsession#enabled = 1
" let g:airline#extensions#obsession#indicator_text = "{ॐ }"
" let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
" let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
" let g:airline_section_z = ''

" ======== startify ======== 
let g:startify_change_to_dir = 0
let g:startify_lists = [
          \ { 'type': 'sessions'  , 'header': ['   Sessions'                     ] } ,
          \ { 'type': 'files'     , 'header': ['   Files'                        ] } ,
          \ { 'type': 'dir'       , 'header': ['   Current Directory '. getcwd() ] } ,
          \ { 'type': 'bookmarks' , 'header': ['   Bookmarks'                    ] } ,
          \ ]
let g:startify_change_to_vcs_root = 1
" let g:startify_session_dir = g:sessions_dir
let g:startify_session_autoload = 1
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

" ======== git ========
let g:fzf_branch_actions = {
      \ 'diff': {
      \   'prompt': 'Diff> ',
      \   'execute': 'Git diff {branch}',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-f',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'rebase':{
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} -C {cwd} pull origin --rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:true,
      \ },
      \}
let g:git_messenger_include_diff = 'current'

" $ conflict-marker.vim
" disable the default highlight group
let g:conflict_marker_highlight_group = ''
" Include text after begin and end markers
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'
" highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirsmakeprg guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81

let g:gitgutter_highlight_lines=0

function PrevAction() abort
  try
    exe ':cp'
  catch
    ConflictMarkerPrevHunk
    Gitsigns prev_hunk
  endtry
endfunction

function NextAction() abort
  try
    exe ':cn'
  catch
      ConflictMarkerNextHunk
      Gitsigns next_hunk
  endtry
endfunction

nnoremap <C-n> :call NextAction()<CR>
nnoremap <C-p> :call PrevAction()<CR>

nnoremap <leader>giq :call GSquash()<CR>
nnoremap <leader>gin :exe "Git push --set-upstream origin ". fugitive#head()<CR>
nnoremap <leader>gig :exe "Git reset --hard origin/". fugitive#head()<CR>
nnoremap <leader>gij :exe "normal! a" . matchstr(fugitive#head(), 'PICAF-\_[0-9]*'). " "<CR>a
nnoremap <leader>gpr :Git pull --rebase origin/
nnoremap <leader>gpm :Git pull --merge origin/

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
  \ 'a' : [':Gitsigns stage_hunk' , 'stage hunk'     ] ,
  \ 'b' : {
    \ 'name' : '+Branches',
    \ 'b' : [':GBranches' , 'Checkout branch' ] ,
    \ 'f' : [':GBranches diff'                , 'Diff branch'                 ] ,
    \ 'm' : [':GBranches merge'               , 'Merge branch'                ] ,
    \ 'n' : [':GBranches create'       , 'Create branch'  ] ,
    \ 'r' : [':GBranches rebase'              , 'Rebase with branch'          ] ,
    \ },
  \ 'B' : [':Git blame'              , 'blame'           ] ,
  \ 'c' : {
    \ 'name' : '+Ccommands',
    \ 'a' : [':Commits'  , 'branch commits' ] ,
    \ 'b' : [':BCommits' , 'buffer commits' ] ,
    \ 'c' : [':Git commit'             , 'commit'         ] ,
    \ 'f' : [ ':GV!'                          , 'GV file commit'                 ] ,
    \ 'g' : [ ':GV'                           , 'GV commits'                 ] ,
    \ 'o' : [':GBranches' , 'Checkout branch' ] ,
    \ 's' : [':!git commit --amend --no-edit'             , 'ammend commit'         ] ,
    \ 't' : [':GTags' , 'Checkout tags' ] ,
    \ },
  \ 'd' : [':Gitsigns diffthis'                      , 'diff'                        ] ,
  \ 'D' : [':Gdiffsplit'                    , 'diff split'                  ] ,
  \ 'g' : [':Git'                           , 'Git '                        ] ,
  \ 'h' : [':Gitsigns preview_hunk'   , 'preview hunk'                ] ,
  \ 'l' : [':Gclog'                , 'logs'                        ] ,
  \ 'L' : [':Git log --stat'             , 'logs with changes'           ] ,
  \ 'p' : {
    \ 'name' : '+Pcommands',
    \ 'f' : [':Git fetch'                      , 'push'                        ] ,
    \ 'm' : 'pull --merge origin' ,
    \ 'p' : [':Git pull'                      , 'pull'                        ] ,
    \ 'r' : 'pull --rebase origin' ,
    \ 'u' : [':Git push'                      , 'push'                        ] ,
    \ },
  \ 's' : {
    \ 'name' : '+Scommands',
    \ 'a' : [':Gitsigns stage_hunk' , 'stage hunk'     ] ,
    \ 'b' : [':Gitsigns stage_buffer'              , 'stage buffer'     ] ,
    \ 'h' : [':Telescope git_stash'       , 'git stash list' ] ,
    \ 'r' : [':Gitsigns reset_buffer'      , 'reset buffer'                   ] ,
    \ 's' : [':Telescope git_status'       , 'git status'     ] ,
    \ 'u' : [':Gitsigns undo_stage_hunk'      , 'undo staged hunk'                   ] ,
    \ },
  \ 't' : {
    \ 'name' : '+Gutter',
    \ 'd' : [':Gitsigns toggle_deleted' , 'toggle deleted hunks'             ] ,
    \ 'n' : [':Gitsigns toggle_numhl' , 'toggle num highlight'             ] ,
    \ 'l' : [':Gitsigns toggle_current_line_blame' , 'toggle num highlight'             ] ,
    \ 's' : [':Gitsigns toggle_signs'          , 'toggle signs'                ] ,
    \ 'h' : [':Gitsigns toggle_linehl' , 'highlight hunks'             ] ,
    \ },
  \ 'u' : [':Gitsigns reset_hunk'      , 'reset hunk'                   ] ,
  \ '[' : [':diffget //2 | diffupdate'      , 'hunk from the target parent' ] ,
  \ ']' : [':diffget //3 | diffupdate'      , 'hunk from the merge parent'  ] ,
  \ 'i' : {
    \ 'name' : '+advance',
    \ 'm' : [':Git merge --continue'        , 'merge continue'    ] ,
    \ 'r' : [':Git rebase --continue'       , 'rebase continue'   ] ,
    \ 'p' : [':Git push --force'            , 'push force'        ] ,
    \ 'c' : [':Git commit -m "fast-commit"' , 'quick commit'      ] ,
    \ 's' : [':Git rebase -i HEAD~2'        , 'squash cur commit' ] ,
    \ 'f' : [':!git checkout -- .'          , 'flus changes'      ] ,
    \ 'q' : 'fast squash',
    \ 'n' : 'push upstream new',
    \ 'g' : 'reset branch',
    \ 'j' : 'insert jira ticket no.',
    \ },
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
function FindList(expr) abort
  exec ':Find '.a:expr
  call timer_start(1000, { tid -> feedkeys("\<M-a>\<CR>")})
endfunction

command -nargs=1 FindList call FindList(<f-args>)

""" Uncomment following if you want to see search result in floating window
" ======== file ======== 
let g:ranger_map_keys = 0
nnoremap <leader>fs :Find<SPace>
nnoremap <leader>fj :exe "Find ". expand('<cword>') <CR>
nnoremap <leader>fS :FindAll<SPace>
nnoremap <leader>fJ :exe "FindAll ". expand('<cword>') <CR>
nnoremap <leader>fqel :Doline<SPace>
nnoremap <leader>fqef :Dofile<SPace>
nnoremap <leader>fqd :Reject<SPace>
nnoremap <leader>fqll :LoadList<SPace>
nnoremap <leader>fqla :LoadListAdd<SPace>
nnoremap <leader>fqk :Keep<space>
nnoremap <leader>fqq :FindList<SPace>
nnoremap <leader>fqr :Restore<CR>
nnoremap <leader>fqss :SaveList<SPace>
nnoremap <leader>fqsa :SaveListAdd<SPace>

function PFiles() abort
  if fugitive#head() == ''
    Files
  else
    GFiles
  endif
endfunction
" nnoremap <leader>fS :lua require("telescope-config").live_grep_all()<CR>
" nnoremap <leader>fJ :lua require("telescope-config").grep_string_all()<CR>
" nnoremap <leader>ff :lua require("telescope-config").project_files()<CR>
nnoremap <leader>ff :call PFiles()<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:leader_map['o'] = [':Buffers' , 'Show Open buffers']
let g:leader_map['p'] = [':Windows' , 'Show Open Windows']
let g:leader_map['r'] = [':Ranger'  , 'Ranger']
let g:leader_map['f'] = {
  \ 'name' : '+file'      ,
  \ 'f' : 'Project files' ,
  \ 'F' : [':Files'          , 'Files'              ] ,
  \ 'g' : [':Rg'          , 'Live Grep'              ] ,
  \ 'h' : [':Helptags'    , 'help tags'              ] ,
  \ 'l' : [':Lines'       , 'Find in current buffer' ] ,
  \ 'm' : [':Marks'       , 'marks'                  ] ,
  \ 'M' : [':Maps'        , 'normal maps'            ] ,
  \ 'o' : [':History'     , 'Previously open files'  ] ,
  \ 'p' : [':Files'       , 'files'                  ] ,
  \ 'q' : {
    \ 'name' : '+QuickFix',
    \ 'e' : {
      \ 'name' : '+Execute',
      \ },
    \ 'l' : {
      \ 'name' : '+Load',
      \ },
    \ 's' : {
      \ 'name' : '+Save',
      \ },
    \ },
  \ 't' : [':BTags'       , 'current buffer tags'    ] ,
  \ 'T' : [':Tags'        , 'project tags'           ] ,
  \ 'z' : [':FZF'         , 'FZF'                    ] ,
  \ }

"" Uncomment following if you want to see search result in floating window
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
nnoremap <leader>en :edit $HOME/.nvimrc <CR>
nnoremap <leader>ep :edit $HOME/.nvimrc.plug <CR>
nnoremap <leader>ez :edit $HOME/.zshrc <CR>
nnoremap <leader>ee :lua require("telescope-config").search_dotfiles()<CR>

" ======== tmux-jump.vim ======== 
" jump to file with position using filepath from sibling panes in tmux
" Requires fzf
nnoremap <leader>ft :TmuxJumpFile<CR>



function CopyLine(line) abort
  let l:win = winnr()
   wincmd w | exec a:line | exec 'norm yy' | exec l:win . 'wincmd w' | norm p
endfunction

function CopyPara(line,nlineBelow)
  let l:win = winnr()
   wincmd w | exec a:line | exec 'norm y'. a:nlineBelow .'j'| exec l:win . 'wincmd w' | norm p
endfunction

command -nargs=1 CLine call CopyLine(<args>)
command -nargs=* CPara call CopyPara(<f-args>)
nnoremap <leader>yy :CLine<space>
nnoremap <leader>yp :CPara<space>

" TODO complete
function CopyDiff(line) abort
  let l:win = winnr()
  let l:curline = getline(l:line)
  wincmd w 
  let l:targetline = getline(l:line)
  exec l:win . 'wincmd w' | norm p
endfunction

autocmd FileType purescript nnoremap <silent> <buffer> <localleader>f :!purs-tidy format-in-place %<CR>


