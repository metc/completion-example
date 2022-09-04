_compadd() {
	COMPREPLY=($(compgen -W "$1" -- "$cur"))
}

_main() {
	case "$cur" in
		--*)
			_compadd "--help --version"
			;;
		*)
			_compadd "$(git --list-cmds=list-mainporcelain)"
			;;
	esac
}

_wrap_main() {
	local cur="${COMP_WORDS[COMP_CWORD]}"
	_main
}

complete -F _wrap_main git
