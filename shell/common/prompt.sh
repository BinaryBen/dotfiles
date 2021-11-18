
export PROMPT_LGBT="\[\033[31m\]❯\[\033[33m\]❯\[\033[32m\]❯\[\033[36m\]❯\[\033[35m\]❯\[\033[31m\]"
export PROMPT_EOL="\[\033[0;37m\] "

export PS1="\n ✓ Command completed at \T\n\n\n ╭─[ \W ]─[ \u@\h ]\n ╰─ $LGBT_PROMPT$PROMPT_EOL"
export PS2="        \[\033[2;30m\]❯$PROMPT_EOL"