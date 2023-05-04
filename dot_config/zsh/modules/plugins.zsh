# Respectfully stolen from
# https://github.com/mattmc3/zsh_unplugged

function plugin-load {
    local repo plugin_name plugin_dir initfile initfiles
    ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
    for repo in $@; do
        plugin_name=${repo:t}
        plugin_dir=$ZPLUGINDIR/$plugin_name
        initfile=$plugin_dir/$plugin_name.plugin.zsh
        if [[ ! -d $plugin_dir ]]; then
            echo "Cloning $repo"
            git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugin_dir
        fi
        if [[ ! -e $initfile ]]; then
            initfiles=($plugin_dir/*.plugin.{z,}sh(N) $plugin_dir/*.{z,}sh{-theme,}(N))
            [[ ${#initfiles[@]} -gt 0 ]] || { echo >&2 "Plugin has no init file '$repo'." && continue }
            ln -sf "${initfiles[1]}" "$initfile"
        fi
        fpath+=$plugin_dir
        (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
    done
}

function plugin-update {
    ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
    for d in $ZPLUGINDIR/*/.git(/); do
        echo "Updating ${d:h:t}..."
        command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
    done
}

function plugin-compile {
    ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
    autoload -U zrecompile
    local f
    for f in $ZPLUGINDIR/**/*.zsh{,-theme}(N); do
        zrecompile -pq "$f"
    done
}
