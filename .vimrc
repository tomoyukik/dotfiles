set shell=bash

"dein 設定 ===============================
if &compatible
  set nocompatible               " Be iMproved
endif

" dein.vim settings {{
"" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
"" }}}

"" dein installation check {{{
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" if &runtimepath !~# '/dein.vim'
"   if !isdirectory(s:dein_repo_dir)
"     execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
"   endif
"   execute 'set runtimepath^=' . s:dein_repo_dir
" endif
"" }}}

"" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " set toml file path
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'
  let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'

  " toml読み込み
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    " pip3 install --upgrade neovim
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " dein setting end
  call dein#end()
  call dein#save_state()
endif
"" }}}

" Required:
filetype plugin indent on
syntax enable

"" installation check {{{
"" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"" }}}

"" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
"" }}}
" }}

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
set tabstop=4
set shiftwidth=4
set clipboard=unnamed
set laststatus=2
set statusline=[%n]
set statusline+=%{matchstr(hostname(),'\\w\\+')}@
set statusline+=%<%F
set showcmd
set spell
set spelllang=en,cjk
set cursorcolumn " set vertical line
set cursorline   " show vertical line
set list
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:␣,extends:⟩,precedes:⟨

highlight Visual ctermbg=194
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight StatusLine term=NONE cterm=NONE ctermfg=88 ctermbg=NONE
highlight StatusLineNC term=NONE cterm=NONE ctermfg=138 ctermbg=NONE
highlight VertSplit term=NONE cterm=NONE ctermfg=251 ctermbg=NONE
highlight LineNr term=underline ctermfg=251 guifg=Grey
highlight EndOfBuffer ctermfg=251
highlight CursorLineNr ctermfg=88 ctermbg=224

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType toml setlocal ts=2 sts=2 sw=2 expandtab

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

inoremap <silent> jj <ESC>
" `:`と`;`の入れ替え
nnoremap ; :
nnoremap : ;
vnoremap : :
vnoremap : ;
" 行の折り返し表示時、表示行単位でカーソル移動
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" Linter ==================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers=['rubocop', '--auto-correct']
let g:python3_host_prog = '/usr/local/bin/python3'
" ==================================================

let g:indent_guides_enable_on_vim_startup = 1

function SOLSpaceHilight()
  syntax match SOLSpace "\s\+$" display containedin=ALL
  highlight SOLSpace term=underline ctermbg=224
endf

autocmd BufNew,BufRead * call SOLSpaceHilight()
autocmd BufWritePre * :%s/\s\+$//e

" python auto format =====================================
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    "--ignote=E501: Ignore completing the length of a line."
    call Preserve(':silent %!autopep8 --ignore=E501 -')
endfunction

augroup python_auto_lint
  autocmd!
  autocmd BufWrite *.py :call Autopep8()
augroup END
" end python auto format =================================
