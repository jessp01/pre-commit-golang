#!/usr/bin/env bash
#
# Capture and print stdout, since gofmt doesn't use proper exit codes
#
set -e -o pipefail

CMD=gofmt
if ! command -v $CMD &> /dev/null ; then
    echo "$CMD not installed or available in the PATH" >&2
    exit 1
fi

output="$($CMD -l -w "$@")"
echo "$output"
[[ -z "$output" ]]
