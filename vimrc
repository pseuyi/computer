au! BufNewFile,BufRead *.svelte set ft=html

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set number
set runtimepath^=~/.vim/bundle/ctrlp.vim
set directory^=$HOME/.vim/tmp//
set termguicolors
set ma
set autoread " reload files automatically
set backupcopy=yes " for parcel hmr

" insert spaces on tab
set tabstop=2 shiftwidth=2 expandtab  autoindent smartindent

" map leader to ','
:let mapleader = ","
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'mileszs/ack.vim'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'Quramy/tsuquyomi'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'justinmk/vim-syntax-extra'
" Plugin '907th/vim-auto-save'
Plugin 'elmcast/elm-vim'
Plugin 'avh4/elm-format'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'valloric/youcompleteme'
Plugin 'itchyny/lightline.vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'elzr/vim-json'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'alx741/vim-hindent'
Plugin 'tidalcycles/vim-tidal'
Plugin 'fatih/vim-go'
Plugin 'Shougo/deoplete.nvim'
Plugin 'stamblerre/gocode'
Plugin 'deoplete-plugins/deoplete-go'
Plugin 'jparise/vim-graphql'

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
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/bundle/Ultisnips']
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

" let g:auto_save = 1
let g:elm_format_autosave = 1

" silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" nerd tree
let NERDTreeShowHidden=1
" NerdTreeToggle alias
nmap <leader>ne :NERDTreeToggle<cr>
autocmd VimEnter * NERDTree

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

