
alias tree 'tree -CA'
alias grep 'grep --color=auto'
alias grep 'grep --color=auto'
alias fgrep 'fgrep --color=auto'
alias egrep 'egrep --color=auto'

# This allows us to use Homebrew versions of things (like git) rather than the pre-installed or XCode installed versions.
# # See http://blog.grayghostvisuals.com/git/how-to-keep-git-updated/ for reference.
# set -g -x PATH /usr/local/bin $PATH

set -gx PATH ~/.cabal/bin $PATH

