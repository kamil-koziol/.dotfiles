PATH=${PATH}:$HOME/bin
export PATH

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' %fon %B%F{161}%b'
 
setopt PROMPT_SUBST

NEWLINE=$'\n';

PROMPT='';
PROMPT+='%B%F{43}%n%b';
PROMPT+=' %fat';
PROMPT+=' %B%F{135}%m%b';
PROMPT+=' %fin';
PROMPT+=' %B%F{208}%3~%b';
PROMPT+='${vcs_info_msg_0_}%b';
PROMPT+='${NEWLINE}';
PROMPT+='%b%f%# ';

alias ll='ls -lah'

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip3
# pip zsh completion end

export PATH="/usr/local/opt/openjdk/bin:$PATH"
