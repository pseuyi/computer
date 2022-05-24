" SETTINGS
set nocompatible              " be improved
filetype off                  " don't detect filetypes 

" vundle and nvim:
" set the runtime path to include Vundle and initialize (nvim)
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'  " required

" vim-jsx-typescript: syntax highlighting
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

set number " show line numbers
set runtimepath^=~/.config/nvim/bundle/ctrlp.vim " find ctrlp
set directory^=$HOME/.vim/tmp// " store swp files
set termguicolors " allow 24-bit colors
set autoread " reload files automatically
au CursorHold,CursorHoldI * checktime " trigger when cursor stops moving
set backupcopy=yes " update files directly (for parcel hmr)
set tabstop=2 shiftwidth=2 expandtab autoindent smartindent " insert spaces on tab
set is hlsearch ai ic scs " highlight search pattern results

" KEYMAPPINGS
" start commands with ,
map leader to ',' 
:let mapleader = ","
" esc twice to turn of search highlighting
nnoremap <esc><esc> :nohls<cr> 

" PLUGINS

" keep Plugin commands between vundle#begin/end.

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'kien/ctrlp.vim'
Plugin 'lifepillar/vim-solarized8'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'valloric/youcompleteme', { 'do': './install.py --clang-completer --system-libclang' }
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'Shougo/deoplete.nvim'
"Plugin 'jiangmiao/auto-pairs'

" elm
"Plugin 'elmcast/elm-vim'
"Plugin 'avh4/elm-format'

" go
"Plugin 'fatih/vim-go'
"Plugin 'stamblerre/gocode'
"Plugin 'deoplete-plugins/deoplete-go'

" haskell
"Plugin 'neovimhaskell/haskell-vim'

" js
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'Quramy/tsuquyomi'

" syntax
Plugin 'dense-analysis/ale'
Plugin 'elzr/vim-json'
"Plugin 'jparise/vim-graphql'
"Plugin 'tarekbecker/vim-yaml-formatter'

" enable deoplete by default
if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif

" vim-go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
" map ,gt to search for decls in package
au FileType go nmap <leader>gt :GoDeclsDir<cr>
" switch to go test
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)

" autocomplete
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/bundle/ultisnips']
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:ycm_use_ultisnips_completer = 1

" lightline configuration
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" make jj escape
inoremap jj <ESC>

" ctrl p
let g:ctrlp_map = '<c-p>'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules\|DS_Store\|.git'
  \ }
"let g:ctrlp_max_files=0

" let g:auto_save = 1
let g:auto_save_events = ["TextChanged","CursorHold"]
"let g:elm_format_autosave = 1

" silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" nerd tree
let NERDTreeShowHidden=1
" NerdTreeToggle alias
nmap <leader>ne :NERDTreeToggle<cr>
autocmd VimEnter * NERDTree

" ale
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'typescript': ['prettier', 'tslint', 'eslint'], 'ruby': ['standardrb', 'rubocop', 'sorbet']}
let g:ale_linters = {'javascript': ['flow-language-server'], 'typescript': ['eslint', 'tsserver']}
let g:ale_lint_on_save = 1
"let g:ale_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
let g:ale_hover_to_floating_preview = 1
"let g:ale_fix_on_save = 1
" let g:ale_sign_error = "🔥"
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "⚠️  "


nnoremap af :ALEFix<CR>
nnoremap ah :ALEHover<CR>
nnoremap ag :ALEGoToDefinition<CR>
nnoremap an :ALENext<CR>
nnoremap ap :ALEPrevious<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" let g:prettier#config#use_tabs = 'false'

" To ignore plugin indent changes, instead use:
" filetype plugin on
""
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set background=light
colorscheme solarized8 
syntax on

:command P Prettier

let g:neoterm_autoscroll = 1

" nvim keymappings
if has('nvim')
  autocmd TermOpen * startinsert
  tnoremap <c-w>N <C-\><C-n>
  tnoremap <c-w><c-c> <C-\><C-n>:exit<CR>
  command! -nargs=* T split | terminal <args>
  command! -nargs=* VT vsplit | terminal <args>

  tnoremap <c-w>H <C-\><C-N><C-w>H
  tnoremap <c-w>J <C-\><C-N><C-w>J
  tnoremap <c-w>K <C-\><C-N><C-w>K
  tnoremap <c-w>L <C-\><C-N><C-w>L
  tnoremap <c-w><c-w> <C-\><C-N><C-w><C-w>
  tnoremap <c-w>W <C-\><C-N><C-w>W
  tnoremap <c-w>gt <C-\><C-N>gt
  tnoremap <c-w>gT <C-\><C-N>gT
endif

