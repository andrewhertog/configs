#alias tf="terragrunt"
alias tg="terragrunt"
alias terraform="terragrunt"
alias tgp="tg plan --terragrunt-source-update"
alias tgp-prod="AWS_PROFILE=production tgp"
alias tg-prod="AWS_PROFILE=production tg"
alias tgp-dev="AWS_PROFILE=dev tgp"
alias tg-dev="AWS_PROFILE=dev tg"

alias holdmybeer="sudo"

export TERRAGRUNT_DOWNLOAD=/tmp/.terragrunt-cache
