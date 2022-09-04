_compadd() {
	COMPREPLY=($(compgen -W "$1" -- "$cur"))
}

_main() {
	local cur="${COMP_WORDS[COMP_CWORD]}"

	case "$cur" in
		--*)
			_compadd "--help --version"
			;;
		*)
			_compadd "$(git --list-cmds=list-mainporcelain)"
			;;
	esac
}

complete -F _main git
