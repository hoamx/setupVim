"Auto reload vimrc
augroup reloadvimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"KEY MAPPINGS
"Leader Key
let mapleader=","
"Use Tab to switch windows
map <Tab> <C-W>w
"Use leader key + e to back to normal mode
inoremap <silent> <leader>e <esc> 
vnoremap <silent> <leader>e <esc>
"Use leader key + w to save file
"inoremap <silent> <leader>w <esc>:w<CR>
nnoremap <silent> <leader>w :w<CR>
"Use leader key + q to quit
nnoremap <silent> <leader>q :q<CR>
"Use leader key +qa to quit all
nnoremap <silent> <leader>qa :qa<CR>
"Use leader key +wqa to save and quit all
nnoremap <silent> <leader>wqa :wqa<CR>
"Use leader key + = to balance windows
nnoremap <leader>= <C-W>=
"Use leader key + hjkl to navigate split
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
"Swap top/bottom or left/right split
nnoremap <leader>R <C-W>R
"Break out current window into a new tabview
nnoremap <leader>T <C-W>T
"Close every window in the current tabview but the current one
nnoremap <leader>o <C-W>o
"Use leader key + ee to edit vimrc
nnoremap <silent> <leader>ee :e $MYVIMRC<CR>
"Use leader key + ev to edit vimrc by splitting into a new window vertically
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
"Use leader key + b to build ctags then set to update tag list automatically after each saving, assume that ctags has been installed into OS and .ctags file exists in Home directory
" nnoremap <silent> <leader>b :!ctags<CR><CR> <bar> :autocmd BufWritePost * call system("ctags")<CR>
"Open tag in a new tab
nnoremap <silent> <leader>d <C-w><C-]><C-w>T
"Use leader + t to jumpback from definition
nnoremap <silent> <leader>t <C-t>
"Use leader key + tb to jumpback a tab
nnoremap <silent> <leader>tb :tabprevious<CR>
"Use leader key + tn to jump to next tab
nnoremap <silent> <leader>tn :tabnext<CR>
"Use // to search for visually selected text
vnoremap // y/<C-R>"<CR>
"Use SPACE to open a fold at the cursor in normal mode
nnoremap <space> zo
"Use leader key + SPACE to open all fold in normal mode
nnoremap <leader><space> zR
"Use C-h and C-l to move to the left and right
nnoremap <c-h> 20h
nnoremap <c-l> 20l
"Move cursor in Insert mode
inoremap <c-h> <left>
inoremap <c-l> <right>
"Use leader key + p or P to paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P

"Retain the selection after indent/unindent
vnoremap > >gv
vnoremap < <gv

"Vim SETTINGS
set hlsearch "Set highlight searching
set number "relativenumber "Vim starts with line numbers and relative number enabling
set numberwidth=4 "Setting number of spaces between line numbers and codes
set autoindent
" set smartindent
set tabstop=8 "Setting tab width: <TAB>
set softtabstop=8 "Setting tabwidth when expandtab is set: <TAB> and <BS>
set shiftwidth=8 "Setting indent: used in <<, >>, ==
set statusline+=%F "Setting visible status line
" set expandtab "Using spaces instead of tab
set ttyfast "make vim scrolls more smoothly, assume fast connection
set ttyscroll=0 "don't know why but this make smooth scroll much better when scroll down (no ghost cursor lines when scrolling down from the last line; no delay cursorline when scrolling down from somewhere in the middle. This will disable scrolling when set mouse=a
"set mouse=a "enable using the mouse
set backspace=indent,eol,start "allow backspacing everything in insert mode
" set foldmethod=marker "enable folding triggered by markers (the {{{ things)
let python_highlight_all=1
syntax on
set fillchars=vert:\│ "continuous vertical split line
"set cursorline "highlight cursor line to easily spot the cursor
set viminfo+=n~/.vim/viminfo "specify the place of viminfo
set noshowmode "show mode using only airline, no need to show below it
set ignorecase "case-insensitive searching
set smartcase "search pattern contains uppercase => case-sensitive, and vice versa
set nowrap "line nowrap
"set direction for spliting
set splitbelow
set splitright
set autoread
set autowrite
set foldmethod=indent
set foldnestmax=10
set foldenable
set foldlevel=99
set nobackup
set nowb
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp
filetype plugin indent on

"Set Ctags search
set tags=./tags,tags;$HOME

" "Set grep tool
" if executable('ack-grep')
" set grepprg=ack-grep
" endif
" 
" "Open search results in a window w/ links and highlight the matches
" command! -nargs=+ Grep execute 'silent noautocmd grep! <args>' | copen | execute 'silent /<args>'
" " Shift-control-* Grep for the word under the word under the cursor
" nmap <leader>g :Grep <c-r>=expand("<cword>")<cr><cr>

"PLUGGINS using Vim-plug
call plug#begin('~/.vim/plugged') "Pluggins START


Plug 'scrooloose/nerdtree' "Directory tree of projects
"Use F4 for NERDTree toggling
nnoremap <F4> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 35 "Set NERDTree sidebar width
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.d$', '\.tmp$']
autocmd VimEnter * NERDTree "Open NERDTree at startup
autocmd VimEnter * wincmd p "Move cursor to main window at opening
"
Plug 'scrooloose/nerdcommenter'
"Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
"Set a language to use its alternate delimiters by default
let g:NERDAltDelims_c = 1
"Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**', 'right': '*/' } }
"Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
"Enable striming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhiteSpace = 1

Plug 'majutsushi/tagbar' "Show functions, variables, etc. of a file
"Use F3 for Tagbar opening
" nnoremap <F3> :TagbarToggle<CR>
silent nnoremap <leader>b :TagbarToggle<CR>
let g:tagbar_sort = 0 "Sort tags according to their orders in file
let g:tagbar_width = 35

Plug 'terryma/vim-multiple-cursors'

Plug 'haya14busa/incsearch.vim' "Searching
" auto disable highlight after searching (by moving cursor)
let g:incsearch#auto_nohlsearch = 1
" If cursor is in first or last line of window, scroll to middle line.
function! s:MaybeMiddle()
    let l:range=2
    if winline() < 1 + l:range || winline() > winheight(0) - l:range
        normal! zz
    endif
endfunction
map <silent> n  <Plug>(incsearch-nohl-n):call <SID>MaybeMiddle()<CR>
map <silent> N  <Plug>(incsearch-nohl-N):call <SID>MaybeMiddle()<CR>
" add N for disabling moving cursor
map *  <Plug>(incsearch-nohl-*)Y
map #  <Plug>(incsearch-nohl-#)Y
map g* <Plug>(incsearch-nohl-g*)Y
map g# <Plug>(incsearch-nohl-g#)Y
map gD <Plug>(incsearch-nohl-gD)Y

let s:center_module = {"name": "Center"}

function! s:center_module.priority(event) abort
    return a:event is# "on_char" ? 999 : 0
endfunction

function! s:center_module.on_leave(cmdline) abort
    if exists("s:center_on_leave_flag")
        unlet s:center_on_leave_flag
        normal! zz
    endif
endfunction

function! s:center_module.on_char_pre(cmdline) abort
    if a:cmdline.is_input("<Over>(center)")
        call a:cmdline.setchar("")
    endif
endfunction

function! s:center_module.on_char(cmdline) abort
    if a:cmdline.is_input("<Over>(center)")
        normal! zz
        let s:center_on_leave_flag = 1
    endif
endfunction

function! s:config_center(...) abort
    return extend(copy({
                \   "modules": [s:center_module],
                \   "keymap": {
                \       "\<Tab>": {
                \           "key": "<Over>(incsearch-next)<Over>(center)",
                \           "noremap": 1
                \       },
                \       "\<S-Tab>": {
                \           "key": "<Over>(incsearch-prev)<Over>(center)",
                \           "noremap": 1
                \       }
                \   },
                \   "is_expr": 0
                \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> / incsearch#go(<SID>config_center({"command": "/"}))
noremap <silent><expr> ? incsearch#go(<SID>config_center({"command": "?"}))
noremap <silent><expr> g/ incsearch#go(<SID>config_center({"command": "/", "is_stay": 1}))


"Plug 'chiel92/vim-autoformat' "Autoformat code: indentation, etc.
"Use F5 for autoformat
"noremap <F5> :Autoformat<CR>


Plug 'cuongcb/youcompleteme', { 'on': [], 'do': './install.py --clang-completer' } "Autocompletion

augroup load_ycm
    autocmd!
    autocmd InsertEnter * call plug#load('youcompleteme') | autocmd! load_ycm
augroup END

let g:ycm_global_ycm_extra_conf='~/.vim/plugged/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_auto_trigger=1
" let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion=['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-k>', '<Up>']
let g:ycm_semantic_triggers = {
	    \ 'c' : ['->', '.'],
	    \ 'cpp' : ['->', '.', '::'],
	    \}


Plug 'terryma/vim-smooth-scroll' "Used to move in a file easily
nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll   ,20 ,2)<CR>
nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll ,20 ,2)<CR>


"Plug 'sjl/gundo.vim' "Undo history
"let g:gundo_right = 1 "move the tree to the right
"nnoremap <F2> :GundoToggle<CR>

Plug 'honza/vim-snippets' "Give SilVer/ultiships database to process

Plug 'SirVer/ultisnips' "Forming funtion syntax: name, parentheses, indentation, etc.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Plug 'jszakmeister/vim-togglecursor' "toggle cursor shape in insert mode, but only useful in some terminals
""let g:togglecursor_leave = "line"
""let g:togglecursor_force = "cursorshape" "Assume the terminal is Konsole

Plug 'jiangmiao/auto-pairs' "auto brackets
let g:AutoPairsMapCh = 0 "unmap <C-h> to delete brackets, quotes in pair

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" This is the default extra key bindings
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors = {
	\ 'fg': ['fg', 'Normal'],
	\ 'bg': ['bg', 'Normal'],
	\ 'hl': ['fg', 'Comment'],
	\ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+': ['fg', 'Statement'],
	\ 'info': ['fg', 'PreProc'],
	\ 'prompt': ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker': ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header': ['fg', 'Comment'], }

" Enable per-command history
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the option used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Open fzf
nnoremap <silent> <leader>f :FZF<CR>

Plug 'vim-airline/vim-airline'
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1 "enable powerline fonts
let g:airline#extensions#tabline#enabled = 1 "display tabline
" let g:airline#extensions#tabline#show_tabs = 1 "enable/disable displaying tabs, regardless of number
let g:airline#extensions#tabline#tab_min_count = 2 "only show tab line when there is >=2 tabs
let g:airline#extensions#tabline#tab_nr_type = 1 "show only tab number
let g:airline#extensions#tabline#show_tab_nr = 1 "enable displaying tab number
let g:airline#extensions#tabline#show_tab_type = 1 "show whether this tab is 'tabs' or 'buffer'
let g:airline#extensions#tabline#show_close_button = 0 "hide close button (X) of one opened tab in the tabline
let g:airline#extensions#tabline#fnamemod = ':t' "show only filename and hide path in tab name
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' "show path when tabs have identical file name
let g:airline#extensions#tabline#show_buffers = 0 "hide buffers to activate tabline formatter right above
" let g:airline#extensions#tabline#left_sep = ' ' "set straight tab
" let g:airline#extensions#tabline#left_alt_sep = '|' "put '|' character between straight tabs on tabline
" let g:airline#extensions#tagbar#enabled = 0 "hide function name on airline, to save performance
let g:airline#extensions#branch#enabled = 1 "display git branch
" let g:airline#extensions#branch#displayed_head_limit = 10 "truncate long branch names to a fixed length
" let g:airline#extensions#branch#format = 2 "truncate all path sections but the last one
let g:airline#extensions#whitespace#enabled = 1 "enable detection of whitespace errors
let g:airline#extensions#whitespace#checks = ['trailing'] "specify which whitespace types to check for errors
let g:airline#extensions#whitespace#show_message = 1 "show messages when whitespace errors occur
let g:airline#extensions#whitespace#mixed_indent_algo = 0 "must be all spaces or all tabs before the first non-whitespace character
let g:airline#extensions#ycm#enabled = 1 "enable ycm integration

Plug 'vim-airline/vim-airline-themes'
let &t_Co = 256 "Vim 16 color mode

"Dracula theme
Plug 'sheerun/dracula-theme' 

"Solarized theme
Plug 'altercation/vim-colors-solarized'
let g:solarized_termcolors = 256

" Kalisi theme 
Plug 'freeo/vim-kalisi'

"Vim syntax highlighting extras
Plug 'justinmk/vim-syntax-extra'

call plug#end() "Pluggins END

"call unite#filters#matcher_default#use(['matcher_glob'])
"call unite#filters#sorter_default#use(['sorter_rank'])

set background=light
colorscheme kalisi

if has('gui_running')
	set background=light
else
	set background=dark
endif

call togglebg#map("F5")
