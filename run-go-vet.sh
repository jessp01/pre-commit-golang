#!/usr/bin/env bash
set -ex
if [ "$1" = "--src-dir" ];then
    SRC_DIR=$1
    cd "$SRC_DIR"
    shift
fi
    
pkg=$(go list)
for dir in $(echo "$@"|xargs -n1 dirname|sort -u); do
  go vet "$pkg/$dir"
done
