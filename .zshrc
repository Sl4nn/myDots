# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#   source /usr/share/zsh/manjaro-zsh-prompt
# fi

# Custom aliases
## Git
alias config="/usr/bin/git --git-dir=$HOME/Git/myDots/ --work-tree=$HOME"
## Emacs
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"
alias doomdoctor="~/.emacs.d/bin/doom doctor"

## GPU switching
alias tonvidia="optimus-manager --switch nvidia"
alias tointel="optimus-manager --switch integrated"
alias tohybrid="optimus-manager --switch hybrid"

## Custom lsd comand
alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -la"

## System maintenance
alias update="sudo pacman -Syyu"

eval "$(starship init zsh)"
pfetch
