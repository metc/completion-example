#compdef git

complete() {}
source completion.bash

_compadd() {
	compadd -- ${=1}
}

_git() {
	local -a COMP_WORDS=($words)
	local COMP_CWORD=$CURRENT
	_main
}
