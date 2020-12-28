" General {{{
" Check if file was changed outside of this editor periodically
au CursorHold * if getcmdwintype() == '' | checktime | endif

let mapleader = ","
let g:mapleader = ","

" :Sudow sudo saves the file
" (useful for handling the permission-denied error)
command! Sudow w !sudo tee % > /dev/null

" }}}
" Plugins {{{

call plug#begin('~/projects/nvim-test/local/share/nvim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'lifepillar/vim-solarized8'
    Plug 'edkolev/tmuxline.vim'

    Plug 'neovim/nvim-lspconfig'

    Plug 'Shougo/deoplete.nvim'
    Plug 'Shougo/deoplete-lsp'

    Plug 'junegunn/fzf.vim'
    set rtp+=~/.fzf

    Plug 'ciaranm/detectindent'
    Plug 'ojroques/nvim-lspfuzzy'
    Plug 'nestorsalceda/vim-strip-trailing-whitespaces'
    Plug 'tpope/vim-fugitive'
    Plug 'troydm/easytree.vim'
    Plug 'rickhowe/diffchar.vim'
    Plug 'neomake/neomake'
call plug#end()

filetype plugin indent on
syntax enable

" }}}
" Uset interface {{{
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
" Open new splits to the right
set splitright
set splitbelow
" }}}
" Appearance {{{
" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Show line numbers
set number
" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

set termguicolors

set background=dark
colorscheme solarized8_flat
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

syntax on

" Show whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
hi NonText ctermfg=237 ctermbg=none gui=italic guifg=#586e75 guibg=NONE
hi SpecialKey ctermfg=237 ctermbg=none guifg=#586e75 guibg=NONE
set list

" }}}
" Indentation {{{
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
" }}}
" Mappings {{{

" Move quickly between splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Quick resize
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
" Remap VIM 0 to first non-blank character
map 0 ^

" vimdiff mappings
if &diff
    nmap <A-n> ]cz.
    nmap <A-p> [cz.
endif

" § to ~
map § ~

" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" }}}
" Plugin Settings {{{

" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}
" nvim-lsp {{{
lua <<EOF
require'lspconfig'.clangd.setup{
    cmd = { "clangd", "--background-index", "--clang-tidy"}
}
EOF

lua << EOF

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
require('lspfuzzy').setup {}

EOF


hi! link LspDiagnosticsDefaultInformation Identifier
hi! link LspDiagnosticsSignInformation Identifier
hi! link LspDiagnosticsVirtualTextInformation NonText

hi! link LspDiagnosticsDefaultWarning Type
hi! link LspDiagnosticsSignWarning Type
hi! link LspDiagnosticsVirtualTextWarning NonText

hi! link LspDiagnosticsDefaultError Special
hi! link LspDiagnosticsSignError Special
hi! link LspDiagnosticsVirtualTextError NonText

sign define LspDiagnosticsSignInformation text=⏺
sign define LspDiagnosticsSignWarning text=▲
sign define LspDiagnosticsSignError text=◼

command! CodeFormat lua vim.lsp.buf.formatting()
command! CodeAction lua vim.lsp.buf.code_action()
command! CodeDefinition lua vim.lsp.buf.definition()
command! CodeDeclaration lua vim.lsp.buf.declaration()
command! CodeHover lua vim.lsp.buf.hover()
command! CodeImplementation lua vim.lsp.buf.implementation()
command! CodeSignature lua vim.lsp.buf.signature_help()
command! CodeType lua vim.lsp.buf.type_definition()
command! CodeReference lua vim.lsp.buf.references()
command! CodeDocumentSymbol lua vim.lsp.buf.document_symbol()
command! CodeWorkspaceSymbol lua vim.lsp.buf.workspace_symbol()
command! CodeShowDiagnostics lua vim.lsp.diagnostic.show_line_diagnostics()

noremap gd :CodeDefinition<CR>
noremap gdd :CodeDeclaration<CR>
noremap gI :CodeImplementation<CR>
noremap gr :CodeReference<CR>
noremap K :CodeHover<CR>
noremap ca :CodeAction<CR>
noremap S :CodeSignature<CR>
noremap T :CodeType<CR>
noremap cf :CodeFormat<CR>
noremap cd :CodeShowDiagnostics<CR>

" }}}
" fzf {{{
let g:fzf_command_prefix = 'Fzf'

command! -bang -nargs=* FzfRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

command! -bang -nargs=* FzfGGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number --color -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..', 'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

noremap <C-g> :FzfRg<CR>
noremap <leader>ff :FzfRg \b<c-r><c-w>\b<CR>
noremap <leader>fg :FzfGGrep \b<c-r><c-w>\b<CR>
noremap <C-p> :FzfGitFiles<CR>
noremap <C-f> :FzfFiles .<CR>
noremap <leader>c :FzfCommands<CR>

" }}}
" detectindent {{{
"
let g:detectindent_preferred_indent = 4
autocmd BufReadPost * :DetectIndent

" }}}
" neomake {{{
" Full config: ihen writing or reading a buffer, and on changes in insert and
"
" " normal mode (after 500ms; no delay when writing).
"
call neomake#configure#automake('nrwi', 500)
let g:neomake_error_sign = {
    \ 'text': '◼',
    \ 'texthl': 'Special',
    \ }
let g:neomake_warning_sign = {
    \   'text': '▲',
    \   'texthl': 'Type',
    \ }
let g:neomake_message_sign = {
     \   'text': '▶',
     \   'texthl': 'NeomakeMessageSign',
     \ }
let g:neomake_info_sign = {
     \ 'text': '⏺',
     \ 'texthl': 'Identifier'
     \ }

hi! link NeomakeVirtualtextError NonText
hi! link NeomakeVirtualtextWarning NonText
hi! link NeomakeVirtualtextInfo NonText
" }}}
" }}}

" vim:foldmethod=marker:foldlevel=0
