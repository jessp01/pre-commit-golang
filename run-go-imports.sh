#!/usr/bin/env bash
#
# Capture and print stdout, since goimports doesn't use proper exit codes
#
set -e -o pipefail

CMD=goimports
if ! command -v $CMD &> /dev/null ; then
    echo "$CMD not installed or available in the PATH" >&2
    echo "please check https://pkg.go.dev/golang.org/x/tools/cmd/goimports" >&2
    exit 1
fi

output="$($CMD -l -w "$@")"
echo "$output"
[[ -z "$output" ]]
