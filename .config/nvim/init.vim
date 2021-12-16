" General {{{
" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

" Check if file was changed outside of this editor periodically
au CursorHold * if getcmdwintype() == '' | checktime | endif

let mapleader = ","
let g:mapleader = ","

" :Sudow sudo saves the file
" (useful for handling the permission-denied error)
command! Sudow w !sudo tee % > /dev/null

set noswapfile

set exrc

set nofoldenable

" }}}
" Plugins {{{

call plug#begin('~/projects/nvim-test/local/share/nvim/plugged')
    Plug 'lifepillar/vim-solarized8'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Plug 'edkolev/tmuxline.vim'

    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/lsp_extensions.nvim'
    "Plug 'nvim-lua/completion-nvim'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'onsails/lspkind-nvim'
    Plug 'liuchengxu/vista.vim'

    "Plug 'Shougo/deoplete.nvim'
    "Plug 'Shougo/deoplete-lsp'

    Plug 'sakhnik/nvim-gdb'

    Plug 'junegunn/fzf.vim'
    set rtp+=~/.fzf

    Plug 'ciaranm/detectindent'
    Plug 'ojroques/nvim-lspfuzzy'
    Plug 'nestorsalceda/vim-strip-trailing-whitespaces'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-vinegar'
    Plug 'troydm/easytree.vim'
    Plug 'rickhowe/diffchar.vim'
    Plug 'neomake/neomake'
    Plug 'vimwiki/vimwiki'
    "Plug 'bfrg/vim-cpp-modern'
    "Plug 'octol/vim-cpp-enhanced-highlight'
    "Plug 'jackguo380/vim-lsp-cxx-highlight'
    "Plug 'm-pilia/vim-ccls'
    Plug 'tpope/vim-commentary'
    Plug 'SirVer/ultisnips'
    Plug 'vim-scripts/DoxygenToolkit.vim'
    Plug 'dhruvasagar/vim-table-mode'

    Plug 'file:///home/mikael.arvids/projects/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    "Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-pandoc/vim-pandoc-after'
    Plug 'aklt/plantuml-syntax'
call plug#end()

syntax enable
filetype plugin indent on

" }}}
" User interface {{{
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
colorscheme solarized8
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline_base16_improved_contrast = 1

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Show whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
hi NonText ctermfg=237 ctermbg=none gui=italic guifg=#586e75 guibg=NONE
hi SpecialKey ctermfg=237 ctermbg=none guifg=#586e75 guibg=NONE
set list

" guicursor might cause garbage characters in some terminals (e.g. alacritty)
set guicursor=

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noselect

" Avoid showing extra messages when using completion
set shortmess+=c
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
"let g:deoplete#enable_at_startup = 1
" }}}
" nvim-lsp {{{
"EOF

lua << EOF
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      return vim_item
    end
  }
}
-- function to attach completion when setting up lsp
-- local on_attach = function(client)
--     require'completion'.on_attach(client)
-- end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require'lspconfig'

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({
--    on_attach=on_attach
})

require('lspfuzzy').setup {}

local util = require 'lspconfig/util'

--nvim_lsp.ccls.setup{
--    cmd = {"ccls"};
--    filetypes = {"c", "cpp", "objc", "objcpp"};
--    root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git");
--    init_options = {
--      highlight = {
--        lsRanges = true;
--      }
--    };
----    on_attach=on_attach;
--    capabilities = capabilities;
--  }

require'lspconfig'.jedi_language_server.setup{}

require'lspconfig'.vimls.setup{}

require'lspconfig'.clangd.setup{
    cmd = { "clangd", "--background-index", "--clang-tidy"};
    capabilities = capabilities;
}

require'lspconfig'.lemminx.setup{
    cmd = { "lemminx" };
    capabilities = capabilities;
}

local signs = { Error = "◼ ", Warn = "▲ ", Hint = "▶ ", Info = "⬤ " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "None" })
end

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
  virtual_text = {
    prefix = "◀",
  }
})

EOF

hi! link DiagnosticSignHint Identifier
hi! link DiagnosticVirtualTextHint NonText

hi! link DiagnosticSignInformation Identifier
hi! link DiagnosticVirtualTextInformation NonText

hi! link DiagnosticSignWarn Type
hi! link DiagnosticVirtualTextWarn NonText

hi! link DiagnosticSignError Special
hi! link DiagnosticVirtualTextError NonText

command! CodeFormat lua vim.lsp.buf.formatting()
command! CodeRangeFormat lua vim.lsp.buf.range_formatting()
command! CodeAction lua vim.lsp.buf.code_action()
command! CodeRename lua vim.lsp.buf.rename()
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
noremap cr :CodeRename<CR>
noremap S :CodeSignature<CR>
noremap T :CodeType<CR>
noremap cf :CodeFormat<CR>
vnoremap cf :CodeRangeFormat<CR>
noremap cd :CodeShowDiagnostics<CR>
"noremap ch :CclsCallHierarchy<CR>

" Enable type inlay hints
"autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
"\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

" Autoformat rust files when saving
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
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
     \ 'text': '⬤',
     \ 'texthl': 'Identifier'
     \ }

hi! link NeomakeVirtualtextError NonText
hi! link NeomakeVirtualtextWarning NonText
hi! link NeomakeVirtualtextInfo NonText

let g:neomake_c_enabled_makers=[]
let g:neomake_cpp_enabled_makers=[]

" }}}
" vimwiki {{{
let wiki = {}
let wiki.path = '/onedrive/vimwiki'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let g:vimwiki_list = [wiki]
let g:vimwiki_global_ext = 0

command! -bang -nargs=* FzfVimWikiRg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'dir': '/onedrive/vimwiki'}, <bang>0)

nmap <Leader>wp :FzfFiles /onedrive/vimwiki/<CR>
nmap <Leader>wf :FzfVimWikiRg<CR>

augroup fileautomation
    autocmd BufEnter index.md :VimwikiTOC
    autocmd BufEnter index.md :VimwikiGenerateLinks
    autocmd BufEnter diary.md :VimwikiDiaryGenerateLinks
augroup end
" }}}
" vim-lsp-cxx-highlight {{{
"hi LspCxxHlGroupMemberVariable gui=bold guifg=#839496
" }}}
" easytree {{{
let g:easytree_git_enable = 0
nnoremap <F2> :EasyTreeToggle<CR>
nnoremap <leader>b :EasyTreeBufferReveal<CR>
" }}}
" nvim treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  --ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    --disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
" }}}
" nvim-gdb {{{
"function! NvimGdbNoTKeymaps()
"  tnoremap <silent> <buffer> <esc> <c-\><c-n>
"endfunction
"
"let g:nvimgdb_config_override = {
"  \ 'key_next': 'n',
"  \ 'key_step': 's',
"  \ 'key_finish': 'f',
"  \ 'key_continue': 'c',
"  \ 'key_until': 'u',
"  \ 'key_breakpoint': 'b',
"  \ 'set_tkeymaps': "NvimGdbNoTKeymaps",
"  \ }
" }}}
" markdown-preview {{{
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 1

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = 'se03-of-wd2679'

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 1

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
function  OpenPreviewPage(url)
  silent exec '!ssh se03-of-wl2078 DISPLAY=$(dig se03-of-wl2078.corp.int +short):0 /home/mikael.arvids/surf.sh ' . a:url
endfunction
let g:mkdp_browserfunc = 'OpenPreviewPage'

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': { 'server': 'http://se03-of-wd2679:8880/plantuml'},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = expand('~/.themes/solarized-dark/css/markdown.css')

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = expand('~/.themes/solarized-dark/css/highlight.css')

" use a custom port to start server or random for empty
let g:mkdp_port = '8800'

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown', 'plantuml']

autocmd FileType markdown,plantuml nnoremap <buffer> <M-p> :MarkdownPreview<CR>
" }}}
" pandoc {{{
let g:pandoc#after#modules#enabled = ["tablemode"]
let g:pandoc#syntax#codeblocks#embeds#langs = ["plantuml"]
" }}}
" vim-table-mode {{{
" ReST-compatible table
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

" Fix problem when filetype is markdown before setting it to pandoc
autocmd FileType pandoc unlet b:table_mode_corner
" }}}

" vim-vista {{{
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_executive_for = {
  \ 'cpp': 'nvim_lsp'
  \ }
nnoremap <F3> :Vista!!<CR>
" }}}
" }}}

" vim:foldmethod=marker:foldlevel=0
