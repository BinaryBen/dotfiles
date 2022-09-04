# Various prompt strings

# Requirements:
# - Prompt goes red if root and displays SUPERUSER icon
# - Prompt shows IP address over SSH
# - Prompt may show personalised icons if configured
# - Prompt defaults to prompt icon otherwise

PS_DEFAULT="${PS1}"   # Save the default prompt

# Super minimalist

export PS0="$ "

# Standard prompt

export PS0="$ "

export PS9="${PS_DEFAULT}"   # Save the default prompt