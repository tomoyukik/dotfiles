set PATH $HOME/.rbenv/bin $HOME/Library/Python/3.7/lib/python/site-packages $HOME/Library/Python/3.7/bin /usr/local/lib/ruby/gems/2.6.0/bin /usr/local/opt/ruby/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin $PATH

set -g theme_title_use_abbreviated_path yes
set -g theme_date_format "+%m/%d/%y %H:%M:%S %Z day %j"

alias ls="ls -1G"
alias lla="ls -al"

alias latexmk="docker run --rm -v (pwd):/root/work -it nontan18/texlive:stable latexmk"

alias haskell="docker run --rm -w /workspace -v (pwd):/workspace haskell:8.8"
alias ghci="docker run --rm -w /workspace -v (pwd):/workspace -it haskell:8.8"
alias ghc="haskell ghc"
alias runghc="haskell runghc"
alias chrome="'/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'"

# set PATH $HOME/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)
set -x RUBY_CONFIGURE_OPTS --with-openssl-dir=(brew --prefix openssl@1.1)

set -g fish_user_paths "/usr/local/opt/tcl-tk/bin"
set -g fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths


# set -x PATH "/usr/local/opt/tcl-tk/bin:$PATH"
# set -x LDFLAGS "-L/usr/local/opt/tcl-tk/lib"
# set -x CPPFLAGS "-I/usr/local/opt/tcl-tk/include"
# set -x PKG_CONFIG_PATH "/usr/local/opt/tcl-tk/lib/pkgconfig"



set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
eval (pyenv init - | source)
eval (pyenv virtualenv-init - | source)


alias hist="history --reverse --show-time='%Y-%m-%d %H:%M:%S '"
alias gitgraph="git log --oneline --decorate --graph --branches --tags --remotes"

if test -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
    source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
end
