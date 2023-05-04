# Code borrowed from https://dev.to/frost/fish-style-abbreviations-in-zsh-40aa

# Mechanism is fairly simple. There is a global array of
# abbreviations. Each abbreviation is also assigned as an alias.
# Each time Space is pressed or a command is entered, the word
# before (if it is the first word in the command) is checked
# against the array of abbreviations. If it is in that array,
# run _expand_alias (see man zshcompsys) against that word.

# declare a list of expandable aliases to fill up later
typeset -a ealiases
ealiases=()

# write a function for adding an alias to the list mentioned above
function abbrev() {
    alias $1
    ealiases+=(${1%%\=*})
}

# expand any aliases in the current line buffer
function expand-ealias() {
    if [[ $LBUFFER =~ "\<(${(j:|:)ealiases})\$" ]]; then
        zle _expand_alias
        zle expand-word
    fi
    zle magic-space
}
zle -N expand-ealias

# Bind the space key to the expand-alias function above, so that space will expand any expandable aliases
bindkey ' '        expand-ealias
bindkey '^ '       magic-space     # control-space to bypass completion
bindkey -M isearch " "      magic-space     # normal space during searches

# A function for expanding any aliases before accepting the line as is and executing the entered command
expand-alias-and-accept-line() {
    expand-ealias
    zle .backward-delete-char
    zle .accept-line
}

zle -N accept-line expand-alias-and-accept-line
