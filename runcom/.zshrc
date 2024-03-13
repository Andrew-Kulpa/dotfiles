[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'


autoload -Uz compinit
compinit

# Load Angular CLI autocompletion.
source <(ng completion script)
