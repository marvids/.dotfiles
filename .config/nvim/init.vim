"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run checktime in buffers, but avoiding the "Command Line" (q:) window
au CursorHold * if getcmdwintype() == '' | checktime | endif

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" :Sudow sudo saves the file
" (useful for handling the permission-denied error)
command! Sudow w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('deoplete-plugins/deoplete-jedi')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('lifepillar/vim-solarized8')
  call dein#add('edkolev/tmuxline.vim')

  call dein#add('nestorsalceda/vim-strip-trailing-whitespaces')
  call dein#add('dense-analysis/ale')

  call dein#add('junegunn/fzf.vim')
  set rtp+=~/.fzf

  call dein#add('chrisbra/csv.vim')
  call dein#add('ciaranm/detectindent')
  call dein#add('tpope/vim-fugitive')
  call dein#add('troydm/easytree.vim')
  call dein#add('sbdchd/neoformat')
  call dein#add('dhruvasagar/vim-table-mode')

  call dein#end()
  call dein#save_state()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=.git\*,.hg\*,.svn\*

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Show line numbers
set number

" Open new splits to the right
set splitright
set splitbelow

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors

colorscheme solarized8
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

syntax on

" Show whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
hi NonText ctermfg=237 ctermbg=none guifg=#3a3a3a guibg=NONE
hi SpecialKey ctermfg=237 ctermbg=none guifg=#3a3a3a guibg=NONE
set list

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
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" --- deoplete ---"
let g:deoplete#enable_at_startup = 1

" --- ale ---"
noremap <leader>gr :ALEFindReferences<CR>
noremap <leader>gd :ALEGoToDefinition<CR>
noremap <leader>gi :ALEHover<CR>
noremap <leader>gn :ALERename<CR>
noremap <leader>gf :call ClangFixLine()<CR>

let g:ale_cpp_clangtidy_checks = [
      \ 'bugprone*',
      \ 'cppcoreguidelines*',
      \ 'clang-analyzer*',
      \ 'misc*',
      \ 'modernize*',
      \ 'performance*',
      \ 'portability*',
      \ 'readability*',
      \ '-readability-uppercase-literal-suffix',
      \ '-modernize-use-trailing-return-type',
      \ ]
let g:ale_c_parse_compile_commands=1
let g:ale_c_clangd_executable='clangd-9'
let g:ale_cpp_clangd_executable='clangd-9'
let g:ale_cpp_clangcheck_executable='clang-check-9'
let g:ale_cpp_clangtidy_executable='clang-tidy-9'
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

let g:ale_sign_warning='❗'
let g:ale_sign_error='❎'
let g:ale_sign_info='ℹ'
let g:ale_sign_style_warning='☢'
let g:ale_sign_style_error='☢'

" Solarized colors
highlight ALEInfoSign guifg=#93a1a1
highlight ALEWarningSign guifg=#b58900
highlight ALEErrorSign guifg=#dc322f
highlight ALEStyleWarningSign guifg=#b58900
highlight ALEStyleErrorSign guifg=#dc322f

function! ClangFixLine()
    let l:filename = expand('%')
    let l:line = line('.')
    let l:cmd = g:ale_cpp_clangtidy_executable . " -fix -fix-errors --line-filter='[{\"name\":\"" . l:filename . "\",\"lines\":[[" . l:line . "," . l:line . "]]}]' --checks=" . join(g:ale_cpp_clangtidy_checks, ',') . " -p " . g:ale_c_build_dir . " " . l:filename
    execute "!" . l:cmd
endfunction

" --- fzf ---"
let g:fzf_command_prefix = 'Fzf'
noremap <C-g> :FzfRg<CR>
noremap <leader>ff :FzfRg \b<c-r><c-w>\b<CR>
noremap <leader>fg :Ggrep <c-r><c-w><CR>:copen<CR>
noremap <C-p> :FzfGitFiles<CR>
noremap <C-f> :FzfFiles .<CR>
noremap <leader>c :FzfCommands<CR>

" --- detectindent ---"
let g:detectindent_preferred_indent = 4
autocmd BufReadPost * :DetectIndent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
for f in split($ADDITIONAL_VIMRCS)
    exe 'source' f
endfor

