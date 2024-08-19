export LESS_TERMCAP_md=$'\e[01;31m'  # Bold text
export LESS_TERMCAP_me=$'\e[0m'      # Reset bold
export LESS_TERMCAP_se=$'\e[0m'      # End standout-mode
export LESS_TERMCAP_so=$'\e[01;44;33m' # Standout-mode (reverse video)
export LESS_TERMCAP_ue=$'\e[0m'      # End underline
export LESS_TERMCAP_us=$'\e[01;32m'  # Start underline
export GROFF_NO_SGR=1
# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion::complete:*' gain-privileges 1

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(oh-my-posh init zsh --config ~/.config/posh/theme.toml)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/fzf-git.sh/fzf-git.sh

alias ls="eza --color=always --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ll='eza -alF --icons=always'
alias la='eza -a --icons=always'
alias tree='eza --tree --color=always --icons=always'
alias cat='bat -P'
alias catb='bat'
alias hist='history | fzf'
alias cd='z'
alias zz='z -'
alias tmux='tmux -u'
alias gs='git status'
alias gd='git diff'
alias make='make && notify-send "Command Completed" "The programme is completed building "'
alias sound='canberra-gtk-play -i audio-volume-change'

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="-1"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}


export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd "$cwd"
	fi
	rm -f -- "$tmp"
}

export EDITOR=nvim

autoload -U add-zsh-hook
add-zsh-hook -Uz chpwd (){ ls; }

function gl() {
    git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' "$@"
}

# Different nvim configs:
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"

function nvims() {
  items=("default" "LazyVim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"
