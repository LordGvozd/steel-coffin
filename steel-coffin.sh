#!/bin/sh
echo -ne '\033c\033]0;steel-coffin\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/steel-coffin.x86_64" "$@"
