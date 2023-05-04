# Taken from grc's zsh plugin at https://github.com/garabik/grc/blob/master/grc.zsh

if command -v grc &> /dev/null; then
    grc_commands=(
        blkid df dig du env fdisk findmnt free getfacl id
        iptables iwconfig last lsblk lsmod lsof mount ping
        ps sensors ss stat traceroute vmstat whois fdisk
    )
    # Set alias for available commands.
    for cmd in $grc_commands ; do
        if (( $+commands[$cmd] )) ; then
            $cmd() {
            grc --colour=auto ${commands[$0]} "$@"
        }
        fi
    done

    # Clean up variables
    unset grc_commands cmd
fi
