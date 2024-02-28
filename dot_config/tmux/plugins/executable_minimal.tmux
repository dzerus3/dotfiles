#!/usr/bin/env bash

# MIT License

# Copyright (c) 2023 Nikhil Singh

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

get_tmux_option() {
    local option=$1
        local default_value="$2"
# shellcheck disable=SC2155
        local option_value=$(tmux show-options -gqv "$option")
        if [ -n "$option_value" ]; then
            echo "$option_value"
                return
                fi
                echo "$default_value"
}

bg=$(get_tmux_option "@minimal-tmux-bg" '#698DDA')

status=$(get_tmux_option "@minimal-tmux-status" "bottom")
justify=$(get_tmux_option "@minimal-tmux-justify" "centre")

indicator_state=$(get_tmux_option "@minimal-tmux-indicator" true)
right_state=$(get_tmux_option "@minimal-tmux-right" true)
left_state=$(get_tmux_option "@minimal-tmux-left" true)

if [ "$indicator_state" = true ]; then
    indicator=$(get_tmux_option "@minimal-tmux-indicator-str" "  tmux  ")
else
    indicator=""
fi

window_status_format=$(get_tmux_option "@minimal-tmux-window-status-format" ' #I:#W ')
status_right=$(get_tmux_option "@minimal-tmux-status-right" "#S")
status_left=$(get_tmux_option "@minimal-tmux-status-left" "#[bg=default,fg=default,bold]#{?client_prefix,,${indicator}}#[bg=${bg},fg=black,bold]#{?client_prefix,${indicator},}#[bg=default,fg=default,bold]")
expanded_icon=$(get_tmux_option "@minimal-tmux-expanded-icon" ' 󰊓 ')
show_expanded_icon_for_all_tabs=$(get_tmux_option "@minimal-tmux-show-expanded-icon-for-all-tabs" false)

status_right_extra="$status_right$(get_tmux_option "@minimal-tmux-status-right-extra" '')"
status_left_extra="$status_left$(get_tmux_option "@minimal-tmux-status-left-extra" '')"

if [ "$right_state" = false ]; then
    status_right_extra=""
fi

if [ "$left_state" = false ]; then
    status_left_extra=""
fi

tmux set-option -g status-position "${status}"
tmux set-option -g status-style bg=default,fg=default
tmux set-option -g status-justify "${justify}"
tmux set-option -g status-left "${status_left_extra}"
tmux set-option -g status-right "${status_right_extra}"
tmux set-option -g window-status-format "${window_status_format}"
tmux set-option -g window-status-current-format "#[bg=${bg},fg=#000000] ${window_status_format}#{?window_zoomed_flag,${expanded_icon}, }"

if [ "$show_expanded_icon_for_all_tabs" = true ]; then
    tmux set-option -g window-status-format " ${window_status_format}#{?window_zoomed_flag,${expanded_icon}, }"
fi
