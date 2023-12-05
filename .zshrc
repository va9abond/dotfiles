# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=( git z zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh


# -------------------------------------------------------------------
# User configuration
# -------------------------------------------------------------------

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


# -------------------------------------------------------------------
# Preferred editor for local and remote sessions
# -------------------------------------------------------------------
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

# if [ "$TERM_PROGRAM" = tmux ]; then
#   export TERM="screen-256color"
# else
#   export TERM="xterm-256color"
# fi

export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
# set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"

export TERM="screen-256color"
export VISUAL="nvim"

# use vi motions in shell
bindkey -v

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# -------------------------------------------------------------------
# alias: git
# -------------------------------------------------------------------
# Add & Commit
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -v"
alias gc!="git commit -v --amend"
alias gca="git commit -v -a"
alias gca!="git commit -v -a -amend"
alias gcam="git commit -a -m"
alias gcmsg="git commit -m"

# Checkout & Branch
alias gco="git checkout"
alias gsw="git switch"
# alias local-branches="!git branch -vv | cut -c 3- | awk '$3 !~/\\[/ { print $1 }'"
# alias conflicts="diff --name-only --diff-filter=U"

# Logs
alias glo="git log --oneline --decorate --color"
alias glog="git log --graph --oneline --decorate --color"
alias gls="git log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate"
alias gll="git log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --numstat"
alias glls="git log --pretty=format:'%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --date=short"

# Work in Progress
alias gst="git status"
alias gss="git status -s"
alias gbl="git blame --color-by-age" # --color-lines

# -------------------------------------------------------------------
# alias: dotfiles
# -------------------------------------------------------------------
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
config config --local status.showUntrackedFiles no


alias zshconf="nvim ~/.zshrc"

alias tmuxconf="nvim ~/.config/tmux/tmux.conf"
alias tmuxso="tmux source-file ~/.config/tmux/tmux.conf"

alias nvimconf="nvim ~/.config/nvim/init.lua"
alias nvimso="source ~/.config/nvim/init.lua"
alias cdnvim="cd ~/.config/nvim"

alias alacconf="nvim ~/.config/alacritty/alacritty.yml"
# alias alacso="source ~/.config/alacritty/alacritty.yml"

# -------------------------------------------------------------------
# alias: latex-template
# -------------------------------------------------------------------
alias getlatex="cp ~/.latex-template/letterfonts.tex ~/.latex-template/macros.tex ~/.latex-template/preamble.tex ~/.latex-template/template.tex ."
alias books="cd ~/Documents/sbooks"
# -------------------------------------------------------------------
# alias: other
# -------------------------------------------------------------------
alias e="nvim"

# alias cd="cd .."
# alias cdcd="cd ..;cd .."

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep -- color=auto"
alias ls="ls --color=auto"
alias ll="ls -lav --ignore=.." # show long listing of all except ".."
alias l="ls -lav -ignore=.?*"  # show long but no hidden dotfiles except "."
alias gitlocal="cd ~/gitlocal"
# alias wiki="cd Documents/wiki"

alias jz="time ./a.out"

alias g03="time g++ -pedantic-errors -Wall -Werror -g3 -O0 --std=c++03"
alias g20="time g++ -pedantic-errors -Wall -Werror -g3 -O0 --std=c++20"
alias clang20="time clang++ -pedantic-errors -Wall -Werror -g3 -O0 --std=c++20"

alias jl="julia"
# -------------------------------------------------------------------
                                          # tmux-sessionizer
bindkey -s ^P "tmux-sessionizer\n"
# bindkey -s ^T "nvim ~/personal/todo.md"
addToPathFront $HOME/bin
# -------------------------------------------------------------------
                                                   # texlive
addToPathFront /usr/local/texlive/2023/bin/x86_64-linux
MANPATH=/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH; export MANPATH
INFOPATH=/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH; export INFOPATH



