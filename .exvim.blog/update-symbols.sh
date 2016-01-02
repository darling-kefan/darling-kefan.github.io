#!/bin/bash
export DEST="./.exvim.blog"
export TOOLS="/Users/tangmi/.vim/tools/"
export TMP="${DEST}/_symbols"
export TARGET="${DEST}/symbols"
sh ${TOOLS}/shell/bash/update-symbols.sh
