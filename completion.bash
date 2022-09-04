_compadd() {
	COMPREPLY=($(compgen -W "$1" -- "${COMP_WORDS[COMP_CWORD]}"))
}

_main() {
	_compadd "$(git --list-cmds=list-mainporcelain)"
}

complete -F _main git
