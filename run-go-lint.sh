#!/usr/bin/env bash

set -eu -o pipefail

CMD=golint
if ! command -v $CMD &> /dev/null ; then
    echo "$CMD not installed or available in the PATH" >&2
    echo "please check https://github.com/golang/lint" >&2
    exit 1
fi

failed=false

for file in "$@"; do
    # redirect stderr so that violations and summaries are properly interleaved.
    if ! $CMD -set_exit_status "$file" 2>&1
    then
        failed=true
    fi
done

if [[ $failed == "true" ]]; then
    exit 1
fi
