export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;76m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]: [\[$(tput sgr0)\]\[\033[38;5;173m\]\d\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;173m\]\T\[$(tput sgr0)\]\[\033[38;5;15m\]] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;39m\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;75m\]\\$\[$(tput sgr0)\] "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH=~/Library/Python/3.6/bin/:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin


alias ll="ls -lG"
alias lla="ls -laG"
alias la="ls -aG"
alias ls="ls -G"
alias dc="docker-compose"
alias ecr-login="$(aws ecr get-login --no-include-email)"
#alias tf="terragrunt"
alias tg="terragrunt"
alias terraform="terragrunt"
alias tgp="tg plan --terragrunt-source-update"
alias tgp-prod="AWS_PROFILE=production tgp"
alias tg-prod="AWS_PROFILE=production tg"
alias tgp-dev="AWS_PROFILE=dev tgp"
alias tg-dev="AWS_PROFILE=dev tg"

alias holdmybeer="sudo"

export PATH=/Users/andrewdenhertog/Library/Python/3.6/bin/:/Library/Frameworks/Python.framework/Versions/3.6/bin:/Users/andrewdenhertog/.nvm/versions/node/v7.10.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/CrossPack-AVR/bin:/Applications/Wireshark.app/Contents/MacOS:/usr/local/opt/go/libexec/bin:/Users/andrewdenhertog/go/bin
export GPG_TTY=$(tty)

export NAME=k8.prodigygame.org
export KOPS_STATE_STORE=s3://k8-prodigygame-org-state-store

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH=$HOME/bin:$PATH
export KUBECONFIG=~/.kube/config-k8s-workshop
export AWS_REGION=us-east-1
export TERRAGRUNT_DOWNLOAD=/tmp/.terragrunt-cache/
export KUBECONFIG=$KUBECONFIG:~/.kube/config-jenkins
export KUBECONFIG=$KUBECONFIG:~/.kube/config

complete -C '/usr/local/bin/aws_completer' aws

export PATH=/Users/andrewdenhertog/bin:/Users/andrewdenhertog/Library/Python/3.6/bin/:/Library/Frameworks/Python.framework/Versions/3.6/bin:/Users/andrewdenhertog/.nvm/versions/node/v7.10.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/CrossPack-AVR/bin:/Applications/Wireshark.app/Contents/MacOS:/usr/local/opt/go/libexec/bin:/Users/andrewdenhertog/go/bin:/Users/andrewdenhertog/bin/platform-tools
export PATH="$HOME/.fastlane/bin:$PATH"
export ANDROID_HOME=/Users/andrewdenhertog/Library/Android/sdk
