#!/bin/sh

case "$1" in
    *.tgz|*.tar.gz) tar tzf "$1";;
    *.tar.bz2|*.tbz2) tar tjf "$1";;
    *.zip) unzip -l "$1";;
    *.7z) 7z l "$1";;
    *.csv) cat "$1" | sed s/,/\\n/g ;;
    *) highlight --out-format ansi "$1" || cat "$1";;
esac
