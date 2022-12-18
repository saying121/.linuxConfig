# 自带的
# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
	alias diff='diff --color=auto'
	alias ip='ip --color=auto'

	export LESS_TERMCAP_mb=$'\E[1;31m'  # begin blink
	export LESS_TERMCAP_md=$'\E[1;36m'  # begin bold
	export LESS_TERMCAP_me=$'\E[0m'     # reset bold/blink
	export LESS_TERMCAP_so=$'\E[01;33m' # begin reverse video
	export LESS_TERMCAP_se=$'\E[0m'     # reset reverse video
	export LESS_TERMCAP_us=$'\E[1;32m'  # begin underline
	export LESS_TERMCAP_ue=$'\E[0m'     # reset underline
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias lal='ls -al'
alias lla='ls -al'
alias l='ls -CF'

# 确定发行版 kali㉿  redhat ;
if [[ $(grep -c kali /etc/os-release) != 0 ]]; then
	prompt_symbol=" "
elif [[ $(grep -c ubuntu /etc/os-release) != 0 ]]; then
	prompt_symbol=" "
elif [[ $(grep -c arch /etc/os-release) != 0 ]]; then
	prompt_symbol=" "
elif [[ $(grep -c suse /etc/os-release) != 0 ]]; then
	prompt_symbol=" "
elif [[ $(grep -c manjaro /etc/os-release) != 0 ]]; then
	prompt_symbol=" "
elif [[ $(grep -c pop /etc/os-release) != 0 ]]; then
	prompt_symbol=" "
else
	prompt_symbol=" "
fi

export all_proxy=http://127.0.0.1:7890
export ALL_PROXY=$all_proxy
export EDITOR='nvim'

if [[ $(uname -a | grep -c WSL) != 0 ]]; then
	if [[ $(grep -c debian /etc/os-release) != 0 ]]; then
		alias proxy="source ~/.linuxConfig/shells/proxy.sh"
		. ~/.linuxConfig/shells/proxy.sh set
	fi
fi

# 自己的alias
# ImageMagick must be installed for icat to work.
alias icat="kitty +kitten icat"

alias clhconf="~/.linuxConfig/configClash.sh"
alias clhres="sudo systemctl restart clash.service"
alias clhsts="systemctl status clash.service"

alias rm="rm -i"

# avoid open nested ranger instances
ranger() {
	if [ -z "$RANGER_LEVEL" ]; then
		/usr/bin/ranger "$@"
	else
		exit
	fi
}
# if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi
