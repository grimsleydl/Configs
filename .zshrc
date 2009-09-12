# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt nobeep
setopt inc_append_history
setopt nohup
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
export SDL_AUDIODRIVER=alsa
#export KDEWM="kwin"
export EDITOR="vim"
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/opt/java/jre/bin:/opt/kde/bin:/usr/bin/perlbin/site:/usr/bin/perlbin/vendor:/usr/bin/perlbin/core:/opt/qt/bin:/usr/local/bin
export KDE_FULL_SESSION=true
export DISPLAY=:0
autoload -Uz compinit promptinit
compinit

promptinit
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1	# Because we didn't really complete anything
}

setopt AUTO_CD
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command'
zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete _approximate
zstyle :compinstall filename /home/davo/.zshrc
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu 'select=long'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' verbose yes

# End of lines added by compinstall
setopt extendedglob
autoload colors
colors


#Prompt faggotry
#PS1="%{${fg[green]}%}[%n]%~ "
if [ -f "/inside-chroot" ]
then
	PROMPT=$'%{\e[0;32m%}[%{\e[0m%}32%~%{\e[0;32m%}]%{\e[0m%}$ '
else
	PROMPT=$'%{\e[0;32m%}[%{\e[0m%}%~%{\e[0;32m%}]%{\e[0m%}$ '
fi
#PS1="%{${fg[green]}%}%n%{${fg[white]}%}:%{${fg[red]}%}%d%{${fg[white]}%}$ "
#fpath=(~/myfns $fpath)
#autoload -U promptinit
#promptinit
#alias ls='ls -lhG'
#PROMPT='%d%>:%{\e[0m%}' # default prompt
#RPROMPT='[%* on %D]' # prompt for right side of screen

#Keybindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[1;5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[1;5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

# bindkey "^[[b" history-beginning-search-forward
# bindkey "^[[a" history-beginning-search-backward
bindkey "\e[A" history-search-backward
bindkey "\e[B" history-search-forward

## Ctrl-W stops at a directory
## see http://www.zsh.org/mla/users/1995/msg00088.html
WORDCHARS='*?_-.[]~\!#$%^(){}<>|`@#$%^*()+:?'

#Aliases
alias ls='ls -F --color=auto'
if ls -lh >/dev/null 2>&1; then
    alias l="ls -lh"
else
    alias l='ls -l'
fi
if ls -a >/dev/null 2>&1; then
    alias ll="l -a"
else
    alias ll='l -A'
fi

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
alias ..........='cd ../../../../../../../../../'
alias ...........='cd ../../../../../../../../../../'
alias -g G='| grep --color=tty'
alias -g GI='| grep -i --color=tty'                     
alias -g GRI='| grep -ri --color=tty'
alias -g L='|less'                                      
alias dfh='df -h | grep -i /dev/sd'                                    
alias dt='dut&&dst&&dft'
alias go='sudo savemixer -L && startx'
alias im=imageshack-upload
alias l='ls -lh'
alias ll='l -a'
alias ls='ls -alF --color=auto --group-directories-first'
alias mkdir='nocorrect mkdir -p'
alias mv='nocorrect mv'
alias nocomment='egrep -v "^\s*(#|$)"'
alias off='sh ~/bin/off.sh'
alias pi='sudo powerpill -S'
alias pu='sudo powerpill -Syu'
alias run-help=man
alias sk='sudo kwrite'
alias smplayer='schroot -p -- smplayer'
alias soundrestart='killall ossxmix && sudo savemixer && sudo soundoff && sudo soundon && sudo savemixer -L'
# alias startx='exec startx'
alias sv='sudo vim'
alias tp=tupac
alias vget='vget --save-dir ~/Videos/'
alias which-command=whence
alias yi='yaourt -S'
alias yq='yaourt -Q'
alias yqi='yaourt -Qi'
alias yql='yaourt -Ql'
alias ys='yaourt -Ss'
alias yu='yaourt -Syu --aur'

### Backup and edit
bak () {
	cp $1 ${1}.bak
}
sbak () {
	sudo cp $1 ${1}.bak
}
sbe () {
	sudo cp $1 $1.bak && sudo vim $1
}
be () {
	cp $1 $1.bak && vim $1
}

dc () {
	lynx -dump "http://www.google.com/search?hl=en&q=define%3A+${1}&btnG=Google+Search" | grep -m 8 -w "*" > /tmp/templookup.txt
	if [[ -s /tmp/templookup.txt ]]
	then
		until ! read response
		do
			echo "${response}"
		done < /tmp/templookup.txt
	else
		echo "Sorry $USER, I can't find the term \"${1} \""
	fi
	rm -f /tmp/templookup.txt
}
dft () {
	df | awk '{s=s+$4} END {print s/1024/1024" GB free"}'
}
dst () {
	df | awk '{s=s+$2} END {print s/1024/1024" GB total"}'
}
dut () {
	df | awk '{s=s+$3} END {print s/1024/1024" GB used"}'
}
et () {
	if [[ -f $1 ]]
	then
		case $1 in
			(*.tar.bz2) bzip2 -v -d $1 ;;
			(*.tar.gz) tar -xvzf $1 ;;
			(*.rar) unrar $1 ;;
			(*.deb) ar -x $1 ;;
			(*.bz2) bzip2 -d $1 ;;
			(*.lzh) lha x $1 ;;
			(*.gz) gunzip -d $1 ;;
			(*.tar) tar -xvf $1 ;;
			(*.tgz) gunzip -d $1 ;;
			(*.tbz2) tar -jxvf $1 ;;
			(*.zip) unzip $1 ;;
			(*.Z) uncompress $1 ;;
			(*) echo "'$1' Error. Please go away" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
findall () {
	find /media/d /media/h /media/m /media/q /media/oldhome/davo/Z /media/e -iname "*$1*$2*$3*$4*"
}
mvw () {
	mv "$@" && cd "${@[-1]}"
}

