"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Be improved
set nocompatible

" Set to auto read when a file is changed from the outside
set autoread

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
au CursorHold * if getcmdwintype() == '' | checktime | endif

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Enable filetype plugins
filetype plugin indent on

set rtp+=~/.vim " Needed for gvim on windows

" Source any .vimrc in the current directory
set exrc

" Restrict some commands since we can source any .vimrc
set secure

let g:os = split(system('uname -o'))[0]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'gregsexton/gitv'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'dkprice/vim-easygrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'altercation/vim-colors-solarized'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'ciaranm/detectindent'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'othree/xml.vim'
Plug 'm42e/arxml.vim', { 'for': 'arxml' }
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'edkolev/tmuxline.vim'
Plug 'vim-scripts/DrawIt'
"Plug 'davidhalter/jedi-vim'
"Plug 'klen/python-mode'
"Plug 'justmao945/vim-clang'
Plug 'lyuts/vim-rtags'
"Plug 'vim-scripts/CCTree'
"Plug 'jeetsukumaran/vim-buffergator'
Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-vinegar'
Plug 'rhysd/vim-clang-format'
"Plug 'bbchung/clighter'
"Plug 'jiangmiao/auto-pairs'
"Plug 'WolfgangMehner/c-support'
Plug 'alepez/vim-gtest'
"Plug 'ciaranm/googletest-syntax'
"Plug 'vim-jp/vim-cpp'
Plug 'drmikehenry/vim-headerguard'

if g:os != "Cygwin"
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
  "Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
  "Plug 'jeaye/color_coded', { 'do': './configure && make'}
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'idanarye/vim-vebugger'
endif

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show line numbers
set number

" Use system clipboard
set clipboard=unnamed

" Highlight too long lines
"highlight OverLength ctermbg=red ctermfg=white guibg=#892929
"match OverLength /\%81v.\+/

" Open new splits to the right
set splitright
set splitbelow

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

let &background = "dark"

try

    if $THEME == "solarized"
      colorscheme solarized
      let g:solarized_termcolors=256
      let g:solarized_termtrans=1
      let g:airline_theme = 'base16'

      highlight BookmarkSign ctermbg=235
      highlight BookmarkAnnotationSign ctermbg=235
      highlight SignColumn ctermbg=235 guibg=black
    elseif $THEME == "gotham"
      colorscheme gotham256
      let g:airline_theme = 'gotham256'
      highlight SignColumn ctermbg=233 guibg=black
    endif
catch
endtry

set t_Co=256

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
    set guifont=DejaVu_Sans_Mono_for_Powerline:h8:cANSI
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Enable undofile
set undofile
set undodir=~/.vim/tmp/undo/

" Put the viminfo file in .vim
if !has('nvim')
  set viminfo+=n~/.vim/tmp/viminfo
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <S-k> :resize +5<CR>
map <S-j> :resize -5<CR>
map <S-l> :vertical resize +5<CR>
map <S-h> :vertical resize -5<CR>
map ö :bnext<CR>
map ä :bprev<CR>
map å <C-]>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" vimdiff mappings
if &diff
    nmap <A-n> ]cz.
    nmap <A-p> [cz.
endif

" § to ~
map § ~

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Grep mappings
:nnoremap gr :grep <cword> *<CR>
:nnoremap Gr :grep <cword> %:p:h/*<CR>
:nnoremap gR :grep '\b<cword>\b' *<CR>
:nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>

autocmd FileType arxml nmap <leader>d :call FollowShortName()<CR>zv<CR>
autocmd FileType arxml nmap <leader>g :call FindShortNameReferences()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Make vim recognize alt key
if !has("nvim")
  let c='a'
  while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
  endw
endif

set timeout ttimeoutlen=50

" Show whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
hi NonText ctermfg=237 ctermbg=none guifg=#3a3a3a guibg=NONE
hi SpecialKey ctermfg=237 ctermbg=none guifg=#3a3a3a guibg=NONE
set list

function! IcaLista()
  %s/\([0-9][0-9,]*\w*\)Ändra/ \1/g
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F2> :NERDTreeToggle<cr>
noremap <F3> :TagbarToggle<cr>
let g:airline_powerline_fonts = 1

let g:UltiSnipsExpandTrigger="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Clang format integration
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" YouCompleteMe mappings
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :YcmCompleter FixIt<CR>

" Format inserted lines after leaving insert mode
" let g:clang_format#auto_format_on_insert_leave = 1

" Disable vim-clang format since we use vim-clang-format plugin
let g:clang_enable_format_command = 0

" Detect indent
autocmd BufReadPost * :DetectIndent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

" Fix problem with å in insert mode
let g:AutoPairsShortcutFastWrap=''

" Ctrl-p
let g:ctrlp_custom_ignore = {
      \ 'dir': 'html$',
      \ 'file': '\v\.(html|pdf)$',
      \ }
let g:ctrlp_by_filename = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => My commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! _conflict(filename)
  exe "vsp" "__THEIRS__"
  exe "silent" "read" "!git diff :1:".a:filename " :2:".a:filename
  exe "set ft=diff"
  exe "setlocal buftype=nofile"
  exe "setlocal bufhidden=hide"
  exe "setlocal noswapfile"

  exe "sp" "__OURS__"
  exe "silent" "read" "!git diff :1:".a:filename " :3:".a:filename
  exe "set ft=diff"
  exe "setlocal buftype=nofile"
  exe "setlocal bufhidden=hide"
  exe "setlocal noswapfile"
endfunc
command! Conflict call _conflict(@%)

for f in split($ADDITIONAL_VIMRCS)
    exe 'source' f
endfor

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

