export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  # zsh-nvm this is commented out because it produces a 'nvm is not compatible with the npm config'
)

#alias vim=/usr/local/bin/vim #use 8.1
alias vim=nvim

ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL 9k CUSTOMISATION
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

declare -A MIDNIGHT_SUN_COLORS
MIDNIGHT_SUN_COLORS[main_color]='75'
MIDNIGHT_SUN_COLORS[untracked_color]='81'
declare -A BACKFIRE_COLORS
BACKFIRE_COLORS[main_color]='9'
BACKFIRE_COLORS[untracked_color]='196'
declare -A IZZET_COLORS
IZZET_COLORS[main_color]='33'
IZZET_COLORS[untracked_color]='75'
declare -A LUX_COLORS
LUX_COLORS[main_color]='27'
LUX_COLORS[untracked_color]='226'
declare -A ICEBERG_BLUE_COLORS
ICEBERG_BLUE_COLORS[main_color]='110'
ICEBERG_BLUE_COLORS[untracked_color]='75'
declare -A GR33N_COLORS
GR33N_COLORS[main_color]='82'
GR33N_COLORS[untracked_color]='10'
declare -A GR3Y_COLORS
GR3Y_COLORS[main_color]='255'
GR3Y_COLORS[untracked_color]='195'
declare -A IC3_COLORS
IC3_COLORS[main_color]='51'
IC3_COLORS[untracked_color]='81'

BLACK_SHADE='234'

read -r MAIN_COLOR UNTRACKED_COLOR <<<$(echo $IZZET_COLORS)

POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=$BLACK_SHADE
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=$MAIN_COLOR
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=$BLACK_SHADE
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=$MAIN_COLOR
POWERLEVEL9K_DIR_HOME_FOREGROUND=$BLACK_SHADE
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$MAIN_COLOR
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$BLACK_SHADE
POWERLEVEL9K_DIR_HOME_BACKGROUND=$MAIN_COLOR
POWERLEVEL9K_STATUS_BACKGROUND=$MAIN_COLOR
POWERLEVEL9K_INDICATOR_BACKGROUND=$MAIN_COLOR
POWERLEVEL9K_HISTORY_BACKGROUND=$MAIN_COLOR
POWERLEVEL9K_TIME_BACKGROUND=$MAIN_COLOR
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=$BLACK_SHADE
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$MAIN_COLOR
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=$UNTRACKED_COLOR
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$BLACK_SHADE
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=$MAIN_COLOR
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$BLACK_SHADE

source $ZSH/oh-my-zsh.sh

. /usr/local/opt/asdf/asdf.sh
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"
export PATH="/usr/local/opt/postgresql/bin:$PATH"
#export EDITOR="nvim"


# installed by cultureamp/big-frontend-repo
bfr() {
  ${HOME}/code/cultureamp/big-frontend-repo/tools/cli/run.sh $@
}

#fzf
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
#forgit - fuzzy git: https://github.com/wfxr/forgit

change-theme() {
  ~/change-theme/main.sh $1 && source ~/.zshrc
}


eval "$(direnv hook zsh)"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
