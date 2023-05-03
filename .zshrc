PATH=${PATH}:$HOME/.bin
export PATH
PATH=${PATH}:$HOME/bin
export PATH

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' %fon %B%F{161}%b'

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

source /Users/kamilkoziol/.docker/init-zsh.sh || true # Added by Docker Desktop

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# conda prompt
#
# # Determines prompt modifier if and when a conda environment is active
precmd_build_prompt() {
  if [[ -n $CONDA_PREFIX ]]; then
    CONDA_ENV=" %fusing %F{cyan}$(basename $CONDA_PREFIX) %f%b"
  # When no conda environment is active, don't show anything
  else
    CONDA_ENV=""
  fi

  # Allow substitutions and expansions in the prompt
  setopt prompt_subst

  NEWLINE=$'\n';

  PROMPT='';
  PROMPT+='%B%F{43}%n%b';
  PROMPT+=' %fat';
  PROMPT+=' %B%F{135}%m%b';
  PROMPT+=' %fin';
  PROMPT+=' %B%F{208}%3~%b';
  PROMPT+='${vcs_info_msg_0_}%b';
  PROMPT+="$CONDA_ENV";
  PROMPT+='${NEWLINE}';
  PROMPT+='%b%f%# ';
}

# Run the previously defined function before each prompt
precmd_functions+=( precmd_build_prompt )


