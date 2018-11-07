"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","
set guicursor=

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! WW w !sudo tee % > /dev/null

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
au CursorHold * if getcmdwintype() == '' | checktime | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/site/pack/plugged')

Plug 'Shougo/neoyank.vim'
Plug 'Shougo/denite.nvim'
Plug 'himanoa/denite-git-grep'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim'
Plug 'neomake/neomake'
Plug 'sjl/gundo.vim'
Plug 'troydm/easytree.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-sleuth'
Plug 'altercation/vim-colors-solarized'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/tmuxline.vim'
Plug 'lyuts/vim-rtags'
Plug 'rhysd/vim-clang-format'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

"Plug 'Rip-Rip/clang_complete'
"Plug 'roxma/nvim-completion-manager'
"Plug 'roxma/ncm-clang'
"Plug 'kien/ctrlp.vim'
"Plug 'gregsexton/gitv'
"Plug 'scrooloose/syntastic'
"Plug 'dkprice/vim-easygrep'
"Plug 'radenling/vim-dispatch-neovim'
"Plug 'mattn/calendar-vim'
"Plug 'mhinz/vim-signify'
"Plug 'tpope/vim-surround'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'othree/xml.vim'
"Plug 'm42e/arxml.vim', { 'for': 'arxml' }
"Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
"Plug 'vim-scripts/DrawIt'
"Plug 'klen/python-mode'
"Plug 'justmao945/vim-clang'
"Plug 'marxin/neo-rtags'
"Plug 'vim-scripts/CCTree'
"Plug 'jeetsukumaran/vim-buffergator'
"Plug 'chrisbra/csv.vim'
"Plug 'tpope/vim-vinegar'
"Plug 'bbchung/clighter'
"Plug 'jiangmiao/auto-pairs'
"Plug 'WolfgangMehner/c-support'

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

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Show incremental commands (like substitue) as you type
set inccommand=nosplit
" Show line numbers
set number

" Open new splits to the right
set splitright
set splitbelow


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &background = "dark"

colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:airline_theme = 'base16'

highlight BookmarkSign ctermbg=235
highlight BookmarkAnnotationSign ctermbg=235
highlight SignColumn ctermbg=235 guibg=black


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" § to ~
map § ~

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Quick replace of word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
hi NonText ctermfg=237 ctermbg=none guifg=#3a3a3a guibg=NONE
hi SpecialKey ctermfg=237 ctermbg=none guifg=#3a3a3a guibg=NONE
set list

function! IcaLista()
  %s/\([0-9][0-9,]*\w*\)Ändra/ \1/g
endfunction

" Enable undofile
set undofile
set undodir=~/.vim/tmp/undo/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F2> :EasyTreeToggle<cr>
noremap <F3> :TagbarToggle<cr>
let g:airline_powerline_fonts = 1


" Clang format integration
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" Format inserted lines after leaving insert mode
"let g:clang_format#auto_format_on_insert_leave = 1

" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

fun! <SID>GitClangFormat()
    let l = line(".")
    let c = col(".")
    :w %
    silent !git-clang-format -f %
    :e! %
    call cursor(l, c)
endfun
"autocmd FileType c,cpp,objc autocmd BufWritePre <buffer> :call <SID>GitClangFormat()

" Denite
nnoremap <C-p> :DeniteProjectDir file_rec<cr>
nnoremap <C-g> :DeniteProjectDir -buffer-name=grep -default-action=quickfix grep:::!<CR>
nnoremap <leader>g :DeniteCursorWord grep:.<CR>

call denite#custom#map(
   \ 'insert',
   \ '<C-j>',
   \ '<denite:move_to_next_line>',
   \ 'noremap'
   \)
call denite#custom#map(
   \ 'insert',
   \ '<C-k>',
   \ '<denite:move_to_previous_line>',
   \ 'noremap'
   \)

call denite#custom#var('file_rec', 'command',
    \ ['ag', '--path-to-agignore', '~/.agignore', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#source(
\ 'grep', 'matchers', ['matcher_regexp'])

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
    \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Neomake
let g:neomake_shellcheck_args = ['-fgcc']

"deoplete
let g:deoplete#enable_at_startup = 1

" deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/3.8/include/'

" RTags
let g:rtagsAutoLaunchRdm = 1

for f in split($ADDITIONAL_VIMRCS)
    exe 'source' f
endfor

