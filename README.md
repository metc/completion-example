This is a simple example of a completion that works both in bash and in zsh. The
zsh code actually makes use of the bash code so it can be reused and not have to
be maintained twice.

The bash version works by simply loading the script:

    source completion.bash

The zsh version needs to be placed inside any directory in your `$fpath` as file
called `_git` (or your command):

    cp completion.zsh ~/.zsh/_git

This is a companion for my video: [Creating a shell completion from scratch
(bash and zsh)](https://www.youtube.com/watch?v=B60JxbIcQys).
