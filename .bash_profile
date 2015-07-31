
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1="\[\033[0;33m\]\u@\h \w \[\033[0m\] \$(parse_git_branch) \n\[\033[0;33m\]>\[\033[0m\] "

source /opt/boxen/env.sh
