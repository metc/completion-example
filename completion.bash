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
	local -a words
	local cword cur

	words=("${COMP_WORDS[@]}")
	cword=$COMP_CWORD
	cur="${words[cword]}"

	_main
}

complete -F _wrap_main git
