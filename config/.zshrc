# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/xgh199/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='[%n@%m %~$] '
export PATH="$HOME/dotfiles/scripts:$PATH"

# Add Arch-specific completions to fpath
fpath=(/usr/share/zsh/site-functions $fpath)

# Initialize the completion system
autoload -Uz compinit
compinit

# Enable Bash completion compatibility (often helps with Git)
autoload -Uz bashcompinit
bashcompinit

# Use a menu for completion
zstyle ':completion:*' menu select

# Group completions by type (e.g., files vs commands)
zstyle ':completion:*' group-name ''
