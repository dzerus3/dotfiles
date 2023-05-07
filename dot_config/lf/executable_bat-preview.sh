#!/bin/bash
# From https://github.com/gokcehan/lf/issues/234#issuecomment-547592685
unset COLORTERM
bat --color=always "$1"
