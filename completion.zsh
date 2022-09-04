#compdef git

complete() {}
source completion.bash

_compadd() {
	compadd -- ${=1}
}

_git() {
	local cur=${words[CURRENT]}
	_main
}
