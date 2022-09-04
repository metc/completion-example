#compdef git

complete() {}
source completion.bash

_compadd() {
	compadd -- ${=1}
}

_git() {
	_main
}
