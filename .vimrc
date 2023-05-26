" STANDARD CONFIGURATION FOR NEOVIM

set number " View number line
set mouse=a " Activate mouse interactive
set encoding=utf-8 " Encoding UTF-8 activate
set nowrap " Disable auto autotuning
set history=1000
set cursorline
set clipboard=unnamed " Uses the system clipboard
set noswapfile " No file swap
set nobackup
set nowritebackup
set backspace=indent,eol,start    " backspace everywhere in insert mode
set autoindent " autoindent always ON.
set expandtab " expand tabs
set shiftwidth=4 "spaces for autoindenting
set softtabstop=4 "remove a full pseudo-TAB when i press <BS>
set splitbelow splitright   " Set the splits to open at the right side and below
set hidden                  " to hide warning when opening files
set ignorecase              " to ignore case in searchs
set scrolloff=8               " Keep at least 8 lines below cursor
set number relativenumber   " Relative numbers for jumping
set nu rnu  "Hybrid. Relative numbers and the current line number
set splitbelow splitright   " Set the splits to open at the right side and below
set foldmethod=manual "To avoid performance issues, I never fold anything
set lazyredraw
set ttyfast
set showmatch      " higlight matching parentheses and brackets
set wildmenu       " enable visual wildmenu
set nohlsearch     " clear highlight after a search
syntax enable
" set paste
let mapleader = " "

" KEYBOARD SHORTCUTS

" KEYMAPS RESET
nnoremap <Esc> <Esc>:VMClear <BAR> :nohl <CR>
inoremap <Esc> <Esc>:VMClear <BAR> :nohl <CR>

" KEYMAPS BUFFER

nnoremap <C-Q> <cmd>:q<CR>
nnoremap <C-S> <cmd>:w<CR>
inoremap <C-S> <cmd>:w<CR>
nnoremap <leader>qq <cmd>:q!<CR>

" KEYMAPS TEXT

vnoremap <C-c> y
inoremap <C-v> <Esc>pi
vnoremap <C-x> d
nnoremap <C-a> gg0vG$
vnoremap <C-a> <Esc>gg0vG$

nnoremap <A-Down> yyp
nnoremap <S-Down> <cmd>:m+1<CR>
nnoremap <S-Up> <cmd>:m-2<CR>
inoremap <C-z> <Esc>:undo<CR>
nnoremap <C-z> <cmd>:undo<CR>
nnoremap <C-y> <cmd>:redo<CR>
nnoremap <C-b> <cmd>:NERDTreeToggle<CR>
nnoremap <C-p> <cmd>:Commentary<CR>
vnoremap <C-p> <S-:>:Commentary<CR>
nnoremap <C-l><C-l> <cmd>:bnext<CR>
nnoremap <C-h><C-h> <cmd>:bprevious<CR>

" KEYMAPS FILES

nnoremap <leader>mp <cmd>:MarkdownPreviewToggle<CR>

"This section validates if vimplug is installed on the system if it is not then install it.

if has('win32') 
  let s:plugins_path = '~/vimfiles/plugins'
else 
  let s:plugins_path = '~/.vim/plugins'
endif

" POLYGLOT CONFIGURATION

let g:polyglot_disabled = [ 'markdown' ]

" Prepare the plugins to be installed

call plug#begin(glob(s:plugins_path))   "directorio donde se van a instalar los plugins

Plug 'dracula/vim', { 'as': 'dracula' } "Theme
Plug 'Yggdroot/indentLine'    "indentacion
Plug 'vim-airline/vim-airline'    "diseño de la barra en la cual se muestran los modos, la linea, etc.
Plug 'vim-airline/vim-airline-themes' "temas para el vim-airline
Plug 'christoomey/vim-tmux-navigator' "Allows you to move between different spaces
Plug 'preservim/vimux' "Plugin that allows multiple spaces
Plug 'preservim/nerdtree' "Tree of files to be used
Plug 'ryanoasis/vim-devicons' "Allows icons to be displayed in the editor
Plug 'tpope/vim-commentary' "Quickly comment on a line
Plug 'jiangmiao/auto-pairs' "Automatically closes braces, brackets and parentheses
Plug 'alvan/vim-closetag' "Automatically closes HTML tags
Plug 'sheerun/vim-polyglot' "Advanced syntax highlighting for different languages
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Syntax autocompletion
Plug 'editorconfig/editorconfig-vim' "Allows you to assign an editor configuration to the project.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Allows integration of fzf
Plug 'junegunn/fzf.vim' "Allows to have commands to search in the files
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "Allows multiple cursors
Plug 'sbdchd/neoformat' "Manages code formatters
Plug 'lewis6991/gitsigns.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

set termguicolors
colorscheme dracula

" AIRLINE CONFIGURATIONS

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" NEOFORMAT CONFIGURATION

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

let g:CODE_FORMATTERS = {
    \ 'python': ['black'],
    \ 'javascript': ['prettier'],
    \ 'typescript': ['prettier'],
    \ 'html': ['prettier'],
    \ 'css': ['prettier'],
    \ 'scss': ['prettier'],
    \ 'javascriptreact': ['prettier'],
    \ 'typescriptreact': ['prettier'],
    \ 'json': ['prettier'],
    \ 'markdown': ['prettier'],
    \ 'xml': ['prettier'],
    \ 'yaml': ['prettier'],
    \ 'java': ['prettier'],
    \ 'kotlin': ['prettier'],
    \ 'less': ['prettier'],
    \ 'php': ['prettier'],
    \ 'astro': ['prettier'],
    \ 'ruby': ['prettier'],
    \ 'lua': ['luaformatter'],
    \ 'cpp': ['clangformat'],
    \ 'c': ['clangformat'],
    \ 'csharp': ['clangformat'],
    \ 'arduino': ['clangformat'],
    \ 'objc': ['clangformat'],
    \ 'go': ['gofmt'],
    \ 'assembly': ['asmfmt'],
    \ 'bazel': ['buildifier'],
    \ 'cmake': ['cmake_format'],
    \ 'csv': ['prettydiff'],
    \ 'dart': ['dartfmt'],
    \ 'erlang': ['erlfmt'],
    \ 'graphql': ['prettier'],
    \ 'toml': ['taplo'],
    \ 'htmldjango': ['djlint'],
    \ 'vue': ['prettier'],
    \ 'swift': ['Swiftformat'],
    \ 'sql': ['sqlfmt'],
    \ 'rust': ['rustfmt'],
    \ 'sass': ['stylelint'],
    \ 'pug': ['pug-beautifier'],
    \ 'zsh': ['shfmt'],
    \ 'svelte': ['prettierd'],
    \ 'ps1': ['PSScriptAnalyzer'],
    \ 'prisma': ['prettier'],
    \ 'jsonc': ['prettier'],
    \ 'blade': ['blade-formatter']
\ }

let g:neoformat_prefer_local_cfg = 1

let g:neoformat_cpp_clangformat = { exe : "clang-format", args : [ "--style=file" ] }
let g:neoformat_c_clangformat = { exe : "clang-format", args : [ "--style=file" ] }
let g:neoformat_csharp_clangformat = { exe : "clang-format", args : [ "--style=file" ]}
let g:neoformat_arduino_clangformat = { exe : "clang-format", args : [ "--style=file" ] }
let g:neoformat_objc_clangformat = { exe : "clang-format", args : [ "--style=file" ] }

let g:shfmt_opt = "-ci"

let g:neoformat_enabled_javascript = get(g:CODE_FORMATTERS, 'javascript', [])
let g:neoformat_enabled_html = get(g:CODE_FORMATTERS, 'html', [])
let g:neoformat_enabled_css = get(g:CODE_FORMATTERS, 'css', [])
let g:neoformat_enabled_scss = get(g:CODE_FORMATTERS, 'scss', [])
let g:neoformat_enabled_typescriptreact = get(g:CODE_FORMATTERS, 'typescriptreact', [])
let g:neoformat_enabled_javascriptreact = get(g:CODE_FORMATTERS, 'javascriptreact', [])
let g:neoformat_enabled_json = get(g:CODE_FORMATTERS, 'json', [])
let g:neoformat_enabled_java = get(g:CODE_FORMATTERS, 'java', [])
let g:neoformat_enabled_kotlin = get(g:CODE_FORMATTERS, 'kotlin', [])
let g:neoformat_enabled_less = get(g:CODE_FORMATTERS, 'less', [])
let g:neoformat_enabled_markdown = get(g:CODE_FORMATTERS, 'markdown', [])
let g:neoformat_enabled_php = get(g:CODE_FORMATTERS, 'php', [])
let g:neoformat_enabled_ruby = get(g:CODE_FORMATTERS, 'ruby', [])
let g:neoformat_enabled_typescript = get(g:CODE_FORMATTERS, 'typescript', [])
let g:neoformat_enabled_xml = get(g:CODE_FORMATTERS, 'xml', [])
let g:neoformat_enabled_yaml = get(g:CODE_FORMATTERS, 'yaml', [])
let g:neoformat_enabled_lua = get(g:CODE_FORMATTERS, 'lua', [])
let g:neoformat_enabled_cpp = get(g:CODE_FORMATTERS, 'cpp', [])
let g:neoformat_enabled_c = get(g:CODE_FORMATTERS, 'c', [])
let g:neoformat_enabled_csharp = get(g:CODE_FORMATTERS, 'csharp', [])
let g:neoformat_enabled_go = get(g:CODE_FORMATTERS, 'go', [])
let g:neoformat_enabled_python = get(g:CODE_FORMATTERS, 'python', [])
let g:neoformat_enabled_arduino = get(g:CODE_FORMATTERS, 'arduino', [])
let g:neoformat_enabled_assembly = get(g:CODE_FORMATTERS, 'assembly', [])
let g:neoformat_enabled_bazel = get(g:CODE_FORMATTERS, 'bazel', [])
let g:neoformat_enabled_cmake = get(g:CODE_FORMATTERS, 'cmake', [])
let g:neoformat_enabled_csv = get(g:CODE_FORMATTERS, 'csv', [])
let g:neoformat_enabled_dart = get(g:CODE_FORMATTERS, 'dart', [])
let g:neoformat_enabled_erlang = get(g:CODE_FORMATTERS, 'erlang', [])
let g:neoformat_enabled_graphql = get(g:CODE_FORMATTERS, 'graphql', [])
let g:neoformat_enabled_toml = get(g:CODE_FORMATTERS, 'toml', [])
let g:neoformat_enabled_htmldjango = get(g:CODE_FORMATTERS, 'htmldjango', [])
let g:neoformat_enabled_vue = get(g:CODE_FORMATTERS, 'vue', [])
let g:neoformat_enabled_swift = get(g:CODE_FORMATTERS, 'swift', [])
let g:neoformat_enabled_sql = get(g:CODE_FORMATTERS, 'sql', [])
let g:neoformat_enabled_rust = get(g:CODE_FORMATTERS, 'rust', [])
let g:neoformat_enabled_sass = get(g:CODE_FORMATTERS, 'sass', [])
let g:neoformat_enabled_pug = get(g:CODE_FORMATTERS, 'pug', [])
let g:neoformat_enabled_objc = get(g:CODE_FORMATTERS, 'objc', [])
let g:neoformat_enabled_zsh = get(g:CODE_FORMATTERS, 'zsh', [])
let g:neoformat_enabled_svelte = get(g:CODE_FORMATTERS, 'svelte', [])
let g:neoformat_enabled_ps1 = get(g:CODE_FORMATTERS, 'ps1', [])
let g:neoformat_enabled_prisma = get(g:CODE_FORMATTERS, 'prisma', [])
let g:neoformat_enabled_jsonc = get(g:CODE_FORMATTERS, 'jsonc', [])
let g:neoformat_enabled_blade = get(g:CODE_FORMATTERS, 'blade', [])

" COC CONFIGURATIONS

" let g:coc_global_extensions = ['coc-pyright', 'coc-json', 'coc-go', 'coc-tsserver', 'coc-html']
let g:coc_global_extensions = [
  \ 'coc-tsserver', 'coc-json', 'coc-html', 'coc-css',
  \ 'coc-python', 'coc-clangd', 'coc-yaml', 'coc-go',
  \ 'coc-sh', 'coc-snippets', 'coc-markdownlint'
  \ ]

" Set diagnostic refresh interval
" let g:coc_diagnostic_refresh_delay = 2000

" Set diagnostic check on insert leave
let g:coc_diagnostic_check_insert_mode = 1

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=200

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

inoremap <silent><expr> <c-.> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> <C-d> <Plug>(coc-definition)
nmap <silent> <C-t>d <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <C-e>  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
