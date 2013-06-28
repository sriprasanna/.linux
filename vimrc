" ===============================================================================
" Author: Cedric Fung <cedric@vec.io>
" Platform: Arch Linux, Vim 7.3
"
" INSTALL:
" $ mkdir -p ~/.vim/bundle
" $ git clone git://github.com/Shougo/neobundle.vim  ~/.vim/bundle/neobundle.vim
" $ vim
" ===============================================================================

set nocompatible

set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', { 'build' : { 'unix' : 'make -f make_unix.mak', }, }
" Navigation
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'spiiph/vim-space'
NeoBundle 'Lokaltog/vim-easymotion'
" UI Additions
NeoBundle 'mutewinter/vim-indent-guides'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'Rykka/colorv.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Lokaltog/vim-powerline', 'develop'
NeoBundle 'osyo-manga/vim-powerline-unite-theme'
" Commands
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'godlygeek/tabular'
" Automatic Helpers
NeoBundle 'IndexedSearch'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'ervandew/supertab'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mhinz/vim-startify'
" Language Additions
NeoBundle 'dag/vim2hs'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'leshill/vim-json'
NeoBundle 'othree/html5.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'avakhov/vim-yaml'
NeoBundle 'vim-scripts/DrawIt'
NeoBundle 'git://fedorapeople.org/home/fedora/wwoods/public_git/vim-scripts.git'
" Libraries
NeoBundle 'L9'
NeoBundle 'tpope/vim-repeat'

NeoBundleCheck
filetype plugin indent on

" -------------
" Interface
" -------------
set t_Co=256
set background=dark
set ruler
set number
set wrap
set laststatus=2
set cmdheight=1
set colorcolumn=128
set cursorline
set cursorcolumn
set showmatch
set matchtime=2
set mousehide
set mouse=a
set noerrorbells
set novisualbell
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=0
let g:solarized_visibility='low'
syntax enable

" ---------------
" Text format
" ---------------
set encoding=utf-8
set cindent
set autoindent
set smarttab
set expandtab
set tabstop=2
set backspace=2
set shiftwidth=2
set backspace=2

" ---------------
" Behaviors
" ---------------
set autoread
set autowrite
set wildmenu
set hidden
set history=1024
set cf
set clipboard+=unnamed
set timeoutlen=250
set foldlevelstart=99
set formatoptions=tcq
set complete=.,w,b,u,U
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set smartcase
set incsearch
set hlsearch

" Set leader to ,
let mapleader=","

" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Remove doc lookup binding
nmap K k
vmap K k

" Common tasks
imap <C-l> <C-x><C-l>
nmap <leader>q' ciw'<Esc>p<Esc>

" ----------------------------------------
" Auto commands
" ----------------------------------------
" :o formatting on o key newlines
autocmd BufNewFile,BufEnter * set formatoptions-=o
" No more complaining about untitled documents
autocmd FocusLost silent! :wa
" When editing a file, always jump to the last cursor position.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line ("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" When save a file, strip the spaces in the end
autocmd BufWritePre * :%s/\s\+$//ge
" set omnifunc
autocmd Filetype *
      \ if &omnifunc == "" |
      \   setlocal omnifunc=syntaxcomplete#Complete |
      \ endif

" ---------------
" Quick spelling fix (first item in z= list)
" ---------------
function! QuickSpellingFix()
  if &spell
    normal 1z=
  else
    " Enable spelling mode and do the correction
    set spell
    normal 1z=
    set nospell
  endif
endfunction

command! QuickSpellingFix call QuickSpellingFix()
nmap <silent> <leader>z :QuickSpellingFix<CR>

" ---------------
" startify
" ---------------
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_show_sessions = 1
let g:startify_show_files = 1
let g:startify_show_files_number = 10
let g:startify_bookmarks = [ '~/.vimrc' ]

" ---------------
" unite.vim
" ---------------
let g:unite_data_directory = '~/.vim/cache/unite'
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_files = 1000
let g:unite_force_overwrite_statusline = 0
let g:unite_prompt = '» '
let g:unite_source_grep_command = 'ack'
let g:unite_source_grep_default_opts = '-H --nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
nnoremap <C-p> :Unite buffer file_rec/async file_mru<CR>
nnoremap <C-m> :Unite file<CR>
nnoremap <leader>/ :Unite grep:.<CR>

" ---------------
" vimshell
" ---------------
let g:vimshell_temporary_directory = expand('~/.vim/cache/vimshell')
let g:vimshell_force_overwrite_statusline = 0

" ---------------
" vimfiler
" ---------------
let g:vimfiler_data_directory = '~/.vim/cache/vimfiler'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_force_overwrite_statusline = 0
nnoremap <C-n> :VimFilerExplorer<CR>

" ---------------
" powerline
" ---------------
let g:Powerline_symbols = 'unicode'
let g:Powerline_cache_dir = expand('~/.vim/cache')

" ---------------
" SuperTab
" ---------------
let g:SuperTabDefaultCompletionType="<c-x><c-n>"
let g:SuperTabContextDefaultCompletionType="<c-x><c-n>"

" ---------------
" neocomplete.vim
" ---------------
let g:acp_enableAtStartup = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_fuzzy_completion = 1

" ---------------
" neosnippet
" ---------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" ---------------
" indent-guides
" ---------------
nmap <silent> <leader>i :IndentGuidesToggle<CR>

" ---------------
" zencoding
" ---------------
let g:user_zen_settings = {
      \  'php' : {
      \    'extends' : 'html',
      \    'filters' : 'c',
      \  },
      \  'xml' : {
      \    'extends' : 'html',
      \  },
      \  'haml' : {
      \    'extends' : 'html',
      \  },
      \  'eruby' : {
      \    'extends' : 'html',
      \  },
      \}

" ---------------
" vim-javascript
" ---------------
let g:html_indent_inctags = "body,head,tbody"
let g:html_indent_autotags = "th,td,tr,tfoot,thead"
let g:html_indent_sciript1 = "inc"
let g:html_indent_style1 = "inc"

" ---------------
" Indent Guides
" ---------------
let g:indent_guides_auto_colors=1
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=5
let g:indent_guides_guide_size=1

" ---------------
" Session
" ---------------
let g:session_autosave=0
let g:session_autoload=0
nnoremap <leader>os :OpenSession<CR>

" ---------------
" Tabular
" ---------------
nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t= :Tabularize /=<CR>
nmap <leader>t: :Tabularize /:\zs<CR>
vmap <leader>t: :Tabularize /:\zs<CR>
nmap <leader>t, :Tabularize /,\zs<CR>
vmap <leader>t, :Tabularize /,\zs<CR>
nmap <leader>t> :Tabularize /=>\zs<CR>
vmap <leader>t> :Tabularize /=>\zs<CR>

" ---------------
" taglist.vim
" ---------------
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
