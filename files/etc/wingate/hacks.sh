#!/bin/sh

function hack_copy() {
    local file="$1"
    shift
    if [ $# -gt 0 ]; then
        local name="$1"
        shift
    fi
    case ${file:0:5} in
    /run/ | /var/ | /tmp/)
        local src="/etc/hacks$file"
        [ -f $src ] || src="/dev/null"
        install -Dv $src "$file"
        ;;
    *)
        install -Dv $file "/tmp$file"
        ;;
    esac
    local retcode="$?"
    [ -z $name ] || eval "$name=/tmp$file"
    return $retcode
}
