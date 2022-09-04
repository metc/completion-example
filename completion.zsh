#compdef git

functions[complete]=:
source completion.bash

_compadd() {
	compadd -- ${=1}
}

_git() {
	local cword cur

	cur=${words[CURRENT]}
	let cword=CURRENT-1

	emulate ksh -c _main
}
