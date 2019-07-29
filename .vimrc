set shell=bash

"dein 設定 ===============================
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/koboritomoyuki/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/koboritomoyuki/.cache/dein')
  call dein#begin('/Users/koboritomoyuki/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/koboritomoyuki/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " 自動補完
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    " pip3 install --upgrade neovim
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1

  " メソッド定義
  " call dein#add('szw/vim-tags')

  call dein#add('tpope/vim-fugitive')

  " linter
  call dein#add('vim-syntastic/syntastic')

  " haskell
  call dein#add('neovimhaskell/haskell-vim', { 'on_ft': 'haskell' })

  " ruby
  call dein#add('ngmy/vim-rubocop', { 'on_ft': 'ruby' })
  call dein#add('vim-ruby/vim-ruby', { 'on_ft': 'ruby' })
  call dein#add('tpope/vim-endwise', { 'on_ft': 'ruby' })

  call dein#add('timcharper/textile.vim', { 'on_ft': 'textile' })
  call dein#add('amiorin/vim-textile', { 'on_ft': 'textile' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
" ========================================

" Configuration file for vim
set modelines=0		" CVE-2007-2438
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

" self-customize
syntax on
set number
set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard=unnamed

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" Linter ==================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers=['rubocop']
" ==================================================
