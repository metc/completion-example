_compadd() {
	COMPREPLY=($(compgen -W "$1" -- "$cur"))
}

_main() {
	local cmd e i

	for ((i = 1; i < cword; i++)); do
		e="${words[i]}"
		case "$e" in
			-*)
				;;
			*)
				cmd="$e"
				break
				;;
		esac
	done

	if [[ -n "$cmd" ]]; then
		_compadd "$(git "$cmd" --git-completion-helper)"
		return
	fi

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
	local -a words=("${COMP_WORDS[@]}")
	local cword=$COMP_CWORD
	_main
}

complete -F _wrap_main git
