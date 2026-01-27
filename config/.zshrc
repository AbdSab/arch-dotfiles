# ===============================
# Zsh configuration - Catppuccin Mocha + Git prompt
# ===============================

# -------------------------------
# History (Upgraded for Stability)
# -------------------------------
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# History Options
setopt APPEND_HISTORY       # Prevent corruption by appending instead of overwriting
setopt SHARE_HISTORY        # Share history across all open terminal tabs
setopt HIST_IGNORE_DUPS     # Don't record a command if it's a duplicate of the last
setopt HIST_IGNORE_ALL_DUPS # Delete old duplicates to keep things tidy
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks
setopt HIST_VERIFY          # Show command before executing history shortcuts

# -------------------------------
# Compinit & Completion Setup
# -------------------------------
zstyle :compinstall filename '/home/xgh199/.zshrc'

autoload -Uz compinit
compinit

# Enable Bash completion compatibility
autoload -Uz bashcompinit
bashcompinit

# Use a menu for completion
zstyle ':completion:*' menu select

# Group completions by type (e.g., files vs commands)
zstyle ':completion:*' group-name ''

# -------------------------------
# Key Bindings
# -------------------------------
bindkey -e
bindkey '^[[3~' delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# -------------------------------
# PATH
# -------------------------------
export PATH="$HOME/dotfiles/scripts:$PATH"

# -------------------------------
# Arch-specific completions
# -------------------------------
fpath=(/usr/share/zsh/site-functions $fpath)

# -------------------------------
# Catppuccin Mocha syntax highlighting
# -------------------------------
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[comment]='fg=#585b70'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[function]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[command]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#a6e3a1,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#fab387,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#fab387'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#fab387'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#cba6f7'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#eba0ac'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#eba0ac'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#eba0ac'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#eba0ac'
ZSH_HIGHLIGHT_STYLES[path]='fg=#cdd6f4,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#f38ba8,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#cdd6f4,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#f38ba8,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#cba6f7'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#eba0ac'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[default]='fg=#cdd6f4'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#cdd6f4'

# Source the plugin (Arch path)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -------------------------------
# Colors (raw, no %{} here)
# -------------------------------
FG_USER='%F{#a6e3a1}'
FG_HOST='%F{#fab387}'
FG_DIR='%F{#f9e2af}'
FG_GIT='%F{#cba6f7}'
FG_RESET='%f'

# -------------------------------
# Git branch function (only inside repos)
# -------------------------------
git_branch() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null) || \
    branch=$(git rev-parse --short HEAD 2>/dev/null)
    echo "[$branch]"
  fi
}

# -------------------------------
# Prompt (fully fixed)
# -------------------------------
setopt PROMPT_SUBST
PROMPT="%{${FG_USER}%}[%n@%{${FG_HOST}%}%m%{${FG_USER}%}] %{${FG_DIR}%}%~ %{${FG_RESET}%}%{${FG_GIT}%}\$(git_branch)%{${FG_RESET}%} %{${FG_USER}%}\$ %{${FG_RESET}%}"
RPROMPT='%F{#585b70}%*%f'
