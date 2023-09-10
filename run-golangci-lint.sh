#!/usr/bin/env bash

set -eu -o pipefail

CMD=golangci-lint
if ! command -v $CMD &> /dev/null ; then
    echo "$CMD not installed or available in the PATH" >&2
    echo "please check https://github.com/golangci/$CMD" >&2
    exit 1
fi

exec $CMD run "$@"
