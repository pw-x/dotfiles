# Update path.

path=('/home/pw/.cargo/bin/' $path)

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
bindkey -e

zstyle :compinstall filename '/home/pw/.zshrc'
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo

zstyle ':completion::complete:*' use-cache 1

# Ignore duplicate entires.
setopt hist_ignore_all_dups
# A useful trick to prevent particular entries from being recorded into a history by preceding them with at least one space.
setopt hist_ignore_space

# Integration for the emacs terminal emulator.
#+beginsrc sh [ -n "$EATSHELLINTEGRATIONDIR" ] && \ source "$EATSHELLINTEGRATIONDIR/zsh" #+endsrc sh

# Manage dotfiles with a bare git repo.
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
