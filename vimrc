" SETTINGS
set nocompatible              " be improved
filetype off                  " don't detect filetypes 

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

" PLUGINS

call plug#begin('~/.vim/plugged')
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'kien/ctrlp.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
" js
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Quramy/tsuquyomi'
" gql
Plug 'jparise/vim-graphql'
" language servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elzr/vim-json'
call plug#end()

" KEYMAPPINGS

" begin commands with ,
:let mapleader = ","

" esc twice to turn of search highlighting
nnoremap <esc><esc> :nohls<cr> 

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

" silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" nerd tree
let NERDTreeShowHidden=1
" NerdTreeToggle alias
nmap <leader>ne :NERDTreeToggle<cr>
autocmd VimEnter * NERDTree

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
:command P Prettier

set background=light
colorscheme solarized8 
syntax on

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

" coc.nvim
let g:coc_global_extensions = ['coc-prettier']

set nobackup
set nowritebackup

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
