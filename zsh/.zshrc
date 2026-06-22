# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/andrew.denhertog/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws kubectl kubectx fzf) 

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH=$PATH:/Users/andrew.denhertog/bin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export TERRAGRUNT_ROOT=/Users/andrew.denhertog/Documents/Repos/SMARTeacher/terraform-cd
export TERRAGRUNT_DISABLE_PROFILE=true
alias vim=nvim
alias k=kubectl
alias cat=bat

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PULUMI_CONFIG_PASSPHRASE=
alias gcams='git commit -a -s -S -m'
alias tg=terragrunt
alias tf=terraform
export GPG_TTY=/dev/ttys005
alias brew='arch -arm64 brew'
alias myip="curl ifconfig.me"
alias login_dev="edctl aws shell -a 719845697152 -r infra_privileged_dev"
alias login_staging="edctl aws shell -a 265645408852 -r infra_privileged_staging"
alias login_prod="edctl aws shell -a 202300184849 -r infra_privileged_production"
alias login_packages="edctl aws shell -a 471112755134 -r infra_privileged_packages"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/andrew.denhertog/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
# Secrets live in ~/.zshrc.local (untracked — never committed)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
export AWS_DEFAULT_REGION=us-east-1
export SANDBOX_NAME=adenhertog
export PRE_COMMIT_ALLOW_NO_CONFIG=1
PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# Created by `pipx` on 2024-05-29 17:14:03
export PATH="$PATH:/Users/andrew.denhertog/.local/bin"
export PATH=$PATH:/Users/andrew.denhertog/bin

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export AWS_REGION=${AWS_DEFAULT_REGION}

export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
#export ANTHROPIC_MODEL='arn:aws:bedrock:us-east-1:265645408852:application-inference-profile/h8za86qahwgw'
#export ANTHROPIC_SMALL_FAST_MODEL='arn:aws:bedrock:us-east-1:265645408852:application-inference-profile/n424j5fk36tr'
#export CLAUDE_CODE_USE_BEDROCK=1
export AWS_REGION=us-east-1
export DISABLE_TELEMETRY=1
#export ANTHROPIC_BASE_URL='https://litellm-proxy.prv.prodigygame.org'
#export ANTHROPIC_AUTH_TOKEN=  # set in ~/.zshrc.local
export PATH="$HOME/bin:$PATH"
alias ssh='TERM=xterm-256color \ssh'
export TG_DOWNLOAD_DIR="/tmp/terragrunt"
source ~/.config/zsh/p10k-keratoconus.zsh
