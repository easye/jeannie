#!/usr/bin/env bash
DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

dest_d="$HOME/.config/common-lisp/source-registry.conf.d/"
mkdir -p ${dest_d}
cp ${DIR}/jeannie.conf "${dest_d}"

