set shell=bash
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
"filetype off                  " required

" 実行時のパスにVundleが含まれるように設定
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Plugin ==================================================
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'neovimhaskell/haskell-vim'
Plugin 'tpope/vim-fugitive'

" 汎用 構文検査
Plugin 'vim-syntastic/syntastic'

" Ruby
Plugin 'ngmy/vim-rubocop'

Plugin 'vim-ruby/vim-ruby'

" All of your Plugins must be added before the following line
call vundle#end()
" ==================================================


filetype plugin indent on    " required

" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
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

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set expandtab
set tabstop=2
set shiftwidth=2

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


