# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/zshconfig//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/twig/zshconfig/ohmyzsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
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
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

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


## Lines configured by zsh-newuser-install
#HISTFILE=~/.histfile
#HISTSIZE=1000000
#SAVEHIST=1000000
#Setopt appendhistory notify
#Bindkey -v
## End of lines configured by zsh-newuser-install
## The following lines were added by compinstall
#Zstyle :compinstall filename '/home/twig/.zshrc'
#
#Autoload -Uz compinit
#Compinit
## End of lines added by compinstall


##########################################
# zsh opts
##########################################

#setopt  autocd autopushd

##########################################
# title window setting
##########################################
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
 print -Pn -- '\e]2;%n@%m %~\a'
 [[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
 print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
 [[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (alacritty*|gnome*|konsole*|putty*|rxvt*|screen*|tmux*|xterm*|termite*) ]]; then
 add-zsh-hook -Uz precmd xterm_title_precmd
 add-zsh-hook -Uz preexec xterm_title_preexec
fi

##########################################
# prompt manip 
##########################################


#PROMPT="%n@%m: %~ :) "


##########################################
# alias cos we 90s
##########################################

alias ll='ls -l'


##########################################
# personal functions
##########################################

vf() {

FILEREGEX=$1
if [[ ! -z "$FILEREGEX" ]]; then
	echo $FILEREGEX
    find -name "$FILEREGEX" -exec vim -p {} +
else
    echo "give me a regex-ish, and i will open all matching files in tabbed vim"
fi

}

avf() {

FILEREGEX=$1
if [[ ! -z "$FILEREGEX" ]]; then
	echo $FILEREGEX
    FILES=`find . | ag  $FILEREGEX`
    #FILES=`find $PWD -name $FILEREGEX`
	echo $FILES
	vim -p ${echo $FILES | sed -e "s/^@/\s/g" }
else
    echo "give me a regex-ish, and i will open all matching files in tabbed vim"
fi

}



##########################################
# perl package management shite
##########################################

PATH="/home/twig/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/twig/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/twig/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/twig/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/twig/perl5"; export PERL_MM_OPT;

# To customize prompt, run `p10k configure` or edit ~/zshconfig//.p10k.zsh.
[[ ! -f ~/zshconfig//.p10k.zsh ]] || source ~/zshconfig//.p10k.zsh
