#!/usr/bin/env bash
#

set -e -o pipefail
MYCMD=shellcheck
if ! command -v $MYCMD &> /dev/null ; then
    echo "$MYCMD not installed or available in the PATH" >&2
    exit 1
fi

for FILE in "$@"; do
    set +e
    if file "$FILE"|grep -q "POSIX shell script" ;then
    set -e
	$MYCMD "$FILE"
    fi
done
