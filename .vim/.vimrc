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
command! Sudow w !sudo tee % > /dev/null

" Enable filetype plugins
filetype plugin indent on

" Source any .vimrc in the current directory
set exrc

" Restrict some commands since we can source any .vimrc
set secure

let g:os = split(system('uname -o'))[0]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" w0rp/ale settings
let g:ale_set_balloons = 1
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-dispatch'

Plug 'dhruvasagar/vim-table-mode'
Plug 'troydm/easytree.vim'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
"Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'lifepillar/vim-solarized8'
Plug 'vimwiki/vimwiki'
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'ciaranm/detectindent'
Plug 'edkolev/tmuxline.vim'
"Plug 'vim-scripts/DrawIt'
"Plug 'davidhalter/jedi-vim'
"Plug 'klen/python-mode'
"Plug 'justmao945/vim-clang'
"Plug 'lyuts/vim-rtags'
"Plug 'vim-scripts/CCTree'
"Plug 'jeetsukumaran/vim-buffergator'
"Plug 'chrisbra/csv.vim'
Plug 'rhysd/vim-clang-format'
"Plug 'bbchung/clighter'
"Plug 'jiangmiao/auto-pairs'
"Plug 'WolfgangMehner/c-support'
"Plug 'alepez/vim-gtest'
"Plug 'ciaranm/googletest-syntax'
"Plug 'vim-jp/vim-cpp'
"Plug 'drmikehenry/vim-headerguard'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'gauteh/vim-cppman'
"Plug 'ervandew/supertab'

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
set hidden

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
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256
set termguicolors

" Enable syntax highlighting
syntax on
set background=dark

colorscheme solarized8
let g:airline_theme = 'base16'

highlight BookmarkSign ctermbg=0 guibg=#073642
highlight BookmarkAnnotationSign ctermbg=0 guibg=#073642
highlight SignColumn ctermbg=0 guibg=#073642

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
set viminfo+=n~/.vim/tmp/viminfo


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

nnoremap <S-up> :resize +5<CR>
nnoremap <S-down> :resize -5<CR>
nnoremap <S-right> :vertical resize +5<CR>
nnoremap <S-left> :vertical resize -5<CR>
nnoremap ö :bnext<CR>
nnoremap ä :bprev<CR>
nnoremap å <C-]>
nnoremap Å <C-[>

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
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

" Show whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
hi NonText ctermfg=237 ctermbg=none guifg=#3a3a3a guibg=NONE
hi SpecialKey ctermfg=237 ctermbg=none guifg=#3a3a3a guibg=NONE
set list

" caused problems while hovering when virtual machine was not in focus
" garbage keystrokes were sent
"set mouse=a
"set ttymouse=xterm2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F3> :TagbarToggle<cr>
let g:airline_powerline_fonts = 1

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Clang format integration
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" Format inserted lines after leaving insert mode
" let g:clang_format#auto_format_on_insert_leave = 1

" Disable vim-clang format since we use vim-clang-format plugin
let g:clang_enable_format_command = 0

" Detect indent
autocmd BufReadPost * :DetectIndent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4

" Fix problem with å in insert mode
let g:AutoPairsShortcutFastWrap=''

let g:fzf_command_prefix = 'Fzf'

noremap <C-g> :FzfRg<CR>
noremap <leader>g :FzfRg \b<c-r><c-w>\b<CR>
noremap <leader>gg :Ggrep <c-r><c-w><CR>:copen<CR>
noremap <C-p> :FzfGitFiles<CR>
noremap <C-f> :FzfFiles .<CR>

" vim-cppman adds : to iskeyword. Remove it
set iskeyword-=:
set iskeyword-==
set iskeyword-=~
set iskeyword-=[
set iskeyword-=]
set iskeyword-=*
set iskeyword-=<
set iskeyword-=>

" ale
noremap <leader>rr :ALEFindReferences<CR>
noremap <leader>rd :ALEGoToDefinition<CR>
noremap <leader>ri :ALEHover<CR>
noremap <leader>rn :ALERename<CR>
noremap <leader>rf :call ClangFixLine()<CR>

let g:ale_cpp_clangtidy_checks = [
            \ 'bugprone*',
            \ 'cppcoreguidelines*',
            \ 'clang-analyzer*',
            \ 'misc*',
            \ 'modernize*',
            \ 'performance*',
            \ 'portability*',
            \ 'readability*',
            \ ]
let g:ale_c_parse_compile_commands=1
let g:ale_c_clangd_executable='/usr/local/clang-9.0.0/bin/clangd'
let g:ale_cpp_clangd_executable='/usr/local/clang-9.0.0/bin/clangd'
let g:ale_cpp_clangcheck_executable='/usr/local/clang-9.0.0/bin/clang-check'
let g:ale_cpp_clangtidy_executable='/usr/local/clang-9.0.0/bin/clang-tidy'
let g:ale_c_clangd_options='--background-index --clang-tidy --clang-tidy-checks='.join(g:ale_cpp_clangtidy_checks, ',')
let g:ale_cpp_clangd_options='--background-index --clang-tidy --clang-tidy-checks='.join(g:ale_cpp_clangtidy_checks, ',')

let g:ale_linters={
            \ 'cpp': ['clangd'],
            \ 'c': ['clangd']
            \}

let g:ale_fixers={
            \ 'cpp': ['clangtidy'],
            \ 'c': ['clangtidy']
            \}

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

augroup fileautomation
  autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
  autocmd BufEnter index.wiki :VimwikiTOC
  autocmd BufEnter index.wiki :VimwikiGenerateLinks
  autocmd BufEnter diary.wiki :VimwikiDiaryGenerateLinks
augroup end

func! __trim_ica_lista()
  %s/.*checkbox__label">//
  %s#</span>.*$##
  %s#.*Ändra##
  %s/^\n//
endfun
command! TrimIcaLista call __trim_ica_lista()
