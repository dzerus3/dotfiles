function configure_aliases
    ls   --version | grep GNU > /dev/null && alias ls 'ls --color=auto'
    grep --version | grep GNU > /dev/null && alias grep 'grep --color=auto'
    diff --version | grep GNU > /dev/null && alias diff 'diff --color=auto'
    alias ip 'ip --color=auto'

    abbr -a cls clear
    abbr -a md mkdir

    abbr -a l ls
    abbr -a ll ls -l
    abbr -a la ls -a
    abbr -a lal ls -al
    abbr -a lla ls -la
    abbr -a lld ls -ld
    abbr -a ldl ls -dl

    # Dotfile configuration
    abbr -a chez chezmoi

    if type -q task
        abbr -a t task
        abbr -a ta task add
    end

    if type -q buku
        abbr -a b buku
        abbr -a ba buku --add
        abbr -a buku-backup buku -e ~/.local/share/buku/bookmarks.md
    end
end
