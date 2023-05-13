if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir -m 0700 -p "/tmp/$(id -u)-runtime-dir"
    fi
fi
